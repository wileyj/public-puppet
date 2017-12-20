## 2015-08-21 - Release 1.2.14

Use docker for acceptance tests

## 2015-06-30 - Release 1.2.13

Fix documentation

## 2015-06-26 - Release 1.2.12

Fix strict_variables activation with rspec-puppet 2.2

## 2015-06-24 - Release 1.2.11

Add support for SLES 12 and newest openSUSE releases
Add acceptance test
Restart postfix instead of reload after package installation (Fixes #90)
Use RHEL SELinux type for /etc/aliases

## 2015-06-19 - Release 1.2.10

Update documentation

## 2015-05-28 - Release 1.2.9

Add beaker_spec_helper to Gemfile

## 2015-05-26 - Release 1.2.8

Use random application order in nodeset

## 2015-05-26 - Release 1.2.7

add utopic & vivid nodesets

## 2015-05-25 - Release 1.2.6

Don't allow failure on Puppet 4

## 2015-05-19 - Release 1.2.5

Add missing ownership

## 2015-05-13 - Release 1.2.4

Add puppet-lint-file_source_rights-check gem

## 2015-05-12 - Release 1.2.3

Don't pin beaker

## 2015-04-27 - Release 1.2.2

Add nodeset ubuntu-12.04-x86_64-openstack

## 2015-04-15 - Release 1.2.1

Use file() function instead of fileserver (way faster)
Fix issue with ldap-alias map

## 2015-04-03 - Release 1.2.0

Allow to pass arrays to postfix::hash::source and postfix::hash::content
IPv6 support
Fix for RedHat
Add RedHat 7 support
Use rspec-puppet-facts for unit tests

## 2015-03-24 - Release 1.1.1

Various spec improvements

## 2015-02-19 - Release 1.1.0

Various specs improvements
Fix specs for postfix::config with ensure => blank 
Simplify relationships and avoid spaceship operators
nexthop parameter is not necessary for postfix::canonical

## 2015-01-07 - Release 1.0.5

Fix unquoted strings in cases

## 2014-11-17 - Release 1.0.2

Add missing postfix_canonical lens to postfix::augeas (GH #59)
Fix unit tests for RH 7

## 2014-10-20 - Release 1.0.1

Setup automatic Forge releases
