# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

#package { 'net-snmp': ensure  => 'installed' }
#package { 'net-snmp-utils': ensure  => 'installed' }
package {'epel-release':
  ensure => 'installed'
}
package {'java-1.8.0-openjdk-devel':
  ensure => 'installed',
  require => Package['epel-release']
}
package { 'wget': ensure  => 'installed' }
package { 'curl': ensure  => 'installed' }

#service { "snmpd":
#  ensure => "running",
#}

class { "maven::maven":
  version => "3.2.1", # version to install
}

class { 'snmp':
  agentaddress => [ 'udp:161', 'udp6:161' ],
  manage_client => true,
  snmp_config   => [ 'defVersion 2c', 'defCommunity boundary', ],
  contact      => 'admin@boundary.com',
  location     => 'Mountain View, CA',
}

#exec { 'update-packages':
#  command => '/usr/bin/yum update -y',
#  creates => '/vagrant/.locks/update-packages',
#}


#file { 'bash_profile':
#  path    => '/home/vagrant/.bash_profile',
#  ensure  => file,
#  require => Class['elasticsearch'],
#  source  => '/vagrant/manifests/bash_profile'
#}

#class { 'java':
#  distribution => 'jdk',
#  version => '1.8'
#}

#java::setup {'java':
#  ensure => 'present',
#  source => '/vagrant/jdk-8u31-linux-x64.gz',
#  deploymentdir => '/usr/lib64/jvm/oracle-jdk8',
#  user => 'root',
#  pathfile => '/etc/profile.d/java.sh',
#  cachedir => "/tmp/java-setup-${name}"
#}




