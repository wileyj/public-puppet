require 'puppet/provider/package'
require 'fileutils'

Puppet::Type.type(:package).provide :go,
    :parent => ::Puppet::Provider::Package do
    desc "Golang module installation"
    commands :rm => "/bin/rm"
    commands :ls => "/bin/ls"

    has_feature :installable 
    has_feature :upgradeable

    def self.parse(line)
        if line.chomp =~ /^([^=]+)==([^=]+)$/
            {:ensure => $2, :name => $1, :provider => name}
        else
        nil
        end
    end

    def self.instances
        packages = []
        packages
    end

    def self.cmd
        "go"
    end

    def query
        self.class.instances.each do |provider_go|
            return provider_go.properties if @resource[:name].downcase == provider_go.name.downcase
        end
        return nil
    end


    def self.get_query
        go(['--list', '...'])
    end

    def update
        install
    end

    def install
        args = %w{get}
        dir = ENV['GOPATH'] + '/src/' + @resource[:name]
        unless dir
            case @resource[:ensure]
                when :latest
                    args << "-u" << @resource[:name]
                else
                    args << @resource[:name]
            end
            exec_go *args
        end
    end

    private
    def exec_go(*args)
        go *args
        rescue NoMethodError => e
        if pathname = which(self.class.cmd)
            self.class.commands :go => pathname
            go *args
        else
            raise e, 'Could not locate the go command.', e.backtrace
        end
    end
end