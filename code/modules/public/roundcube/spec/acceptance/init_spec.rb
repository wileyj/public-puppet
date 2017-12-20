require 'spec_helper_acceptance'

describe 'roundcube' do
  context 'with default configuration' do
    let(:manifest) { <<-EOS
        $required_directories = [
          '/opt',
          '/var/cache/puppet',
          '/var/cache/puppet/archives',
          '/var/www',
        ]

        file { $required_directories:
          ensure => directory,
        }

        package { 'git':
          ensure => installed,
        }

        package { 'php5-cli':
          ensure => installed,
        }

        class { 'roundcube': }
      EOS
    }

    specify 'should provision with no errors' do
      apply_manifest(manifest, :catch_failures => true)
    end

    specify 'should be idempotent' do
      apply_manifest(manifest, :catch_changes => true)
    end

    describe file('/var/www/roundcubemail/composer.json') do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
      its(:content) { should match /"prefer-stable":\s*true/ }
    end

    describe file('/var/www/roundcubemail/config/config.inc.php') do
      it { should be_file }
      it { should be_owned_by 'www-data' }
      it { should be_grouped_into 'www-data' }
      it { should be_mode 440 }
    end

    describe file('/var/www/roundcubemail/installer') do
      it { should_not be_directory }
    end

    describe file('/var/www/roundcubemail/logs') do
      it { should be_directory }
      it { should be_owned_by 'www-data' }
      it { should be_grouped_into 'www-data' }
      it { should be_mode 750 }
    end

    describe file('/var/www/roundcubemail/temp') do
      it { should be_directory }
      it { should be_owned_by 'www-data' }
      it { should be_grouped_into 'www-data' }
      it { should be_mode 750 }
    end

    describe file('/var/www/roundcubemail/vendor/pear/pear-core-minimal') do
      # see https://github.com/tohuwabohu/puppet-roundcube/issues/2
      it { should_not be_directory }
    end
  end

  context 'with custom configuration' do
    let(:manifest) { <<-EOS
        $required_directories = [
          '/opt',
          '/var/cache/puppet',
          '/var/cache/puppet/archives',
          '/var/www',
        ]

        file { $required_directories:
          ensure => directory,
        }

        package { 'git':
          ensure => installed,
        }

        package { 'php5-cli':
          ensure => installed,
        }

        class { 'roundcube':
          imap_host    => 'ssl://localhost',
          imap_port    => 993,
          des_key      => 'beefbeefbeefbeefbeefbeef',
          options_hash => {
            'language'    => 'en_US', # override auto-detection
            'support_url' => 'http://example.com/helpdesk',
          },
        }
      EOS
    }

    specify 'should provision with no errors' do
      apply_manifest(manifest, :catch_failures => true)
    end

    specify 'should be idempotent' do
      apply_manifest(manifest, :catch_changes => true)
    end

    describe file('/var/www/roundcubemail/config/config.inc.php') do
      its(:content) { should match /^\$config\['default_host'\] = 'ssl:\/\/localhost';$/ }
      its(:content) { should match /^\$config\['default_port'\] = '993';$/ }
      its(:content) { should match /^\$config\['des_key'\] = 'beefbeefbeefbeefbeefbeef';$/ }
      its(:content) { should match /^\$config\['language'\] = 'en_US';$/ }
      its(:content) { should match /^\$config\['support_url'\] = 'http:\/\/example\.com\/helpdesk';$/ }
    end
  end

  context 'with custom template' do
    let(:manifest) { <<-EOS
        $required_directories = [
          '/opt',
          '/var/cache/puppet',
          '/var/cache/puppet/archives',
          '/var/www',
        ]

        file { $required_directories:
          ensure => directory,
        }

        package { 'git':
          ensure => installed,
        }

        package { 'php5-cli':
          ensure => installed,
        }

        class { 'roundcube':
          config_file_template => 'roundcube/config/options.php.erb',
          options_hash         => {
            'support_url' => 'http://example.com/',
          },
        }
      EOS
    }

    specify 'should provision with no errors' do
      apply_manifest(manifest, :catch_failures => true)
    end

    specify 'should be idempotent' do
      apply_manifest(manifest, :catch_changes => true)
    end

    describe file('/var/www/roundcubemail/config/config.inc.php') do
      its(:content) { should match /^\$config\['support_url'\] = 'http:\/\/example\.com\/';$/ }
    end
  end
end
