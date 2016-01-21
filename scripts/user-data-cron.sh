#!/bin/bash -v
set -e
YUMREPO="http://s3.amazonaws.com/org-yumrepo/"
ORG="local"
GITREPO="git@github.com:repo/puppet.git"
#define puppet variables
puppet_base="/etc/puppetlabs"
puppet_modulepath="$puppet_base/code/modules"
puppet_manifests="$puppet_base/code/environments/production/manifests"
puppet_sitepp="$puppet_manifests/site.pp"

if [ -f "/etc/sysconfig/one-time-init" ]
then
    CAT=`cat /etc/sysconfig/one-time-init` 
    if [ $CAT -a $CAT == "1" ]
    then
        exit 0
    fi
fi
REGION=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document |grep region | awk -F\" '{print $4}'`
echo $REGION

if [ ! -d /opt/scripts ]
then
    echo "Creating dir /opt/scripts"
    mkdir /opt/scripts/
fi

if [ ! -f /opt/scripts/git.sh ]
then
cat <<EOF> /opt/scripts/git.sh
#!/bin/bash
# The MIT License (MIT)
# Copyright (c) 2013 Alvin Abad
 
if [ \$# -eq 0 ]; then
    echo "Git wrapper script that can specify an ssh-key file
Usage:
    git.sh -i ssh-key-file git-command
    "
    exit 1
fi
 
# remove temporary file on exit
trap 'rm -f /tmp/.git_ssh.\$\$' 0
 
if [ "\$1" = "-i" ]; then
    SSH_KEY=\$2; shift; shift
    echo "ssh -i \$SSH_KEY \\\$@" > /tmp/.git_ssh.\$\$
    chmod +x /tmp/.git_ssh.\$\$
    export GIT_SSH=/tmp/.git_ssh.\$\$
fi
 
# in case the git command is repeated
[ "\$1" = "git" ] && shift
 
# Run the git command
git "\$@"
EOF
chmod 755 /opt/scripts/git.sh
fi

if [ ! -f /etc/yum.repos.d/${ORG}_x86_64.repo ]
then
cat <<EOF> /etc/yum.repos.d/local_x86_64.repo
[local_x86_64]
name=local_x86-64
baseurl=$YUMREPO/x86_64
gpgcheck=0
priority=1
exclude=perl-ExtUtils-MakeMaker* perl-TermReadKey* db4* tkinter27* python27-pip python27-tools python27-setuptools perl-threads*
enabled=1
failovermethod=priority
EOF
fi

if [ ! -f /etc/yum.repos.d/${ORG}_noarch.repo ]
then
cat <<EOF> /etc/yum.repos.d/local_noarch.repo
[local_noarch]
name=local_noarch
baseurl=$YUMREPO/noarch
gpgcheck=0
priority=1
exclude=perl-ExtUtils-MakeMaker* perl-TermReadKey* db4* tkinter27* python27-pip python27-tools python27-setuptools perl-threads*
enabled=1
failovermethod=priority
EOF
fi

if [ ! -d /root/.ssh ]
then
    echo "Creating dir /root/.ssh"
    mkdir /root/.ssh
    chmod 700 /root/.ssh
fi

cat <<EOF> /root/.ssh/puppet
-----BEGIN RSA PRIVATE KEY-----
puppet key
-----END RSA PRIVATE KEY-----
EOF
chmod 600 /root/.ssh/puppet
chown -R root:root /root/.ssh

if [ ! -d /home/ec2-user/.ssh ]
then
    echo "Creating dir /home/ec2-user/.ssh"
    mkdir /home/ec2-user/.ssh
    chmod 700 /home/ec2-user/.ssh
fi

GIT=`rpm -qa | grep "git-" | cut -f3 -d"."`
RUBY=`rpm -qa | grep ruby-[0-9] | cut -f4 -d"."`

echo "GIT: $GIT"
echo "RUBY: $RUBY"

if [ $GIT != "local" ]
then
    echo "remove git"
    yum remove -y git
fi

if [ $RUBY != "local" ]
then
    echo "remove ruby"
    yum remove -y ruby*
fi
yum install -y yum-plugin-priorities 
yum install -y \
    git \
    puppet \
    hiera \
    facter \
    augeas \
    augeas-libs \
    ruby \
    ruby-shadow \
    ruby-libs \
    rubygems \
    rubygem-bigdecimal \
    rubygem-psych \
    rubygem-deep_merge \
    rubygem-sys-proctable \
    rubygem-test-unit \
    rubygem-json_pure \
    rubygem-rgen \
    telnet \
    python27 \
    python27-pip \
    unzip

if [ ! -d /usr/local/aws -o ! -f /usr/local/bin/aws ]
then
    cd /tmp; curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
    unzip -u awscli-bundle.zip; /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
    rm -rf /tmp/awscli-bundle*
fi

if [ ! -d "/opt/scripts" ]
then
    mkdir -p /opt/scripts
fi

if [ ! -d "/u" ]
then
    mkdir /u
fi

if [ ! -f "/usr/bin/pip" ]
then
  ln -s /usr/bin/pip-2.7 /usr/bin/pip
fi

pip list \| grep --quiet boto
if [ $? != 0 ]
then
    pip install boto botocore
fi
yum update -y

mkdir -p /etc/puppetlabs/puppet/
mkdir -p /etc/puppetlabs/code/environments/production

cat <<EOF> /etc/puppetlabs/puppet/puppet.conf
[main]
    codedir         = /etc/puppetlabs/code
    confdir         = \$codedir/hieradata
    environment     = production
    basemodulepath  = \$codedir/environments/production/modules/public:\$codedir/environments/production/modules/local    
    factpath        = /etc/puppetlabs/facter/facts.d
    vardir          = /var/lib/puppet
    logdir          = /var/log/puppet
    rundir          = /var/run/puppet
    lastrunfile     = $vardir/state/last_run_summary.yaml { mode=0664 }
    statefile       = $vardir/state/state.yaml { mode=0664 }
    listen          = false
    summarize       = true
    paramcheck      = true
    report          = false
    pluginsync      = false
    pluginsignore   = .svn CVS .hg .git
EOF

if [ ! -d $puppet_base/.git ];then
    /opt/scripts/git.sh -i /root/.ssh/puppet clone --hard $GITREPO /tmp/puppet-clone
    mv /tmp/puppet-clone/.git $puppet_base/.git
    rm -rf /tmp/puppet-clone
fi
/opt/scripts/git.sh -i /root/.ssh/puppet -C $puppet_base reset --hard origin/HEAD
/opt/scripts/git.sh -i /root/.ssh/puppet -C $puppet_base clean -f -d
/opt/scripts/git.sh -i /root/.ssh/puppet -C $puppet_base pull origin
/opt/scripts/git.sh -i /root/.ssh/puppet -C $puppet_base submodule init
/opt/scripts/git.sh -i /root/.ssh/puppet -C $puppet_base submodule update

if [ -f $puppet_base/scripts/run-puppet ]; then
cat <<EOF> /etc/cron.d/puppet.cron
*/5 * * * *  root  chown -R puppet:puppet $puppet_base && sh $puppet_base/scripts/run-puppet
EOF
fi

exit 0