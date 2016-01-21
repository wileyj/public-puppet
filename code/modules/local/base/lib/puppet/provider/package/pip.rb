require 'puppet/provider/package'
require 'xmlrpc/client'

Puppet::Type.type(:package).provide :pip,
    :parent => ::Puppet::Provider::Package do
    desc "Python27 packages via `pip`."
    has_feature :installable, :uninstallable, :upgradeable, :versionable
    def self.parse(line)
        if line.chomp =~ /^([^=]+)==([^=]+)$/
            {:ensure => $2, :name => $1, :provider => name}
        else
        nil
        end
    end

    def self.instances
        packages = []
        pip_cmd = which(cmd) or return []
        execpipe "#{pip_cmd} freeze" do |process|
            process.collect do |line|
                next unless options = parse(line)
                packages << new(options)
            end
        end
        packages
    end

    def self.cmd
        "pip"
    end

    def query
        self.class.instances.each do |provider_pip|
            return provider_pip.properties if @resource[:name].downcase == provider_pip.name.downcase
        end
        return nil
    end

    def latest
        client = XMLRPC::Client.new2("http://pypi.python.org/pypi")
        client.http_header_extra = {"Content-Type" => "text/xml"}
        client.timeout = 10
        result = client.call("package_releases", @resource[:name])
        result.first
        rescue Timeout::Error => detail
        raise Puppet::Error, "Timeout while contacting pypi.python.org: #{detail}", detail.backtrace
    end

    def install
        args = %w{install -q}
        if @resource[:source]
            if String === @resource[:ensure]
                args << "#{@resource[:source]}@#{@resource[:ensure]}#egg=#{
                @resource[:name]}"
            else
                args << "#{@resource[:source]}#egg=#{@resource[:name]}"
            end
        else
            case @resource[:ensure]
                when String
                    args << "#{@resource[:name]}==#{@resource[:ensure]}"
                when :latest
                    args << "--upgrade" << @resource[:name]
                else
                    args << @resource[:name]
            end
        end
        lazy_pip *args
    end

    def uninstall
        lazy_pip "uninstall", "-y", "-q", @resource[:name]
    end

    def update
        install
    end

    private
    def lazy_pip(*args)
        pip *args
        rescue NoMethodError => e
        if pathname = which(self.class.cmd)
            self.class.commands :pip => pathname
            pip *args
        else
            raise e, 'Could not locate the pip command.', e.backtrace
        end
    end
end
