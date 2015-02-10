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


host { 'localhost':
      target => '/etc/hosts',
host_aliases => ['localhost.localdomain'],
          ip => '127.0.0.1',
      ensure => 'present'
}

host { 'localhost6':
      target => '/etc/hosts',
host_aliases => ['localhost6.localdomain6'],
          ip => '::1',
      ensure => 'present'
}

host { 'boundary-snmp-001':
      comment => 'Test SNMP server #1',
       target => '/etc/hosts',
 host_aliases => [],
           ip => '192.168.33.21',
       ensure => 'present'
}
host { 'boundary-snmp-002':
      comment => 'Test SNMP server #2',
       target => '/etc/hosts',
 host_aliases => [],
           ip => '192.168.33.22',
       ensure => 'present'
}
host { 'boundary-snmp-003':
      comment => 'Test SNMP server #3',
       target => '/etc/hosts',
 host_aliases => [],
           ip => '192.168.33.23',
       ensure => 'present'
}
host { 'boundary-puppet-master-003':
      comment => 'Test Puppet Master',
       target => '/etc/hosts',
 host_aliases => [],
           ip => '192.168.33.01',
       ensure => 'present'
}

node default {

}

node /^boundary-snmp-00\.*/ {

#  resources { "firewall":
#    purge => true,
#  }

#  Firewall {
#    before  => Class['my_fw::post'],
#    require => Class['my_fw::pre'],
#  }
#
#  class { 'firewall': }


#  firewall { '161 open port 161':
#    dport => 161
#  }

}




