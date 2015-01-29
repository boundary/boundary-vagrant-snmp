# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

package {'epel-release':
  ensure => 'installed'
}

#exec { 'update-packages':
#  command => '/usr/bin/yum update -y',
#  creates => '/vagrant/.locks/update-packages',
#  require => Package['epel-release']
#}

package {'java-1.8.0-openjdk-devel':
  ensure => 'installed',
  require => Package['epel-release']
}

package { 'wget': ensure  => 'installed' }
package { 'curl': ensure  => 'installed' }
package { 'git': ensure  => 'installed' }

class { "maven::maven":
  version => "3.2.1",
}

class { 'snmp':
  agentaddress => [ 'udp:161', 'udp6:161' ],
  manage_client => true,
  snmp_config   => [ 'defVersion 2c', 'defCommunity boundary', ],
  contact      => 'admin@boundary.com',
  location     => 'Mountain View, CA',
}




