Boundary Vagrant SNMP
=====================

Configures an environment for testing Boundary SNMP integrations and plugins.

Platforms
---------

- Any platform the supports Vagrant and Virtual Box

### Prerequisites

- [Vagrant](https://www.vagrantup.com) version 1.6.3 or later
- [VirtualBox](https://www.virtualbox.org) version 4.3.14 or later

### Setup

Setup requires that the prequisites are installed on the target platform. Puppet is used to configure the virtual machine with the relevant puppet manifest located in the sub-directory `manifests`.

### Download the Java Virtual Machine

1. Due to its size the Java virtual machine is not included in the repository and is required to be downloaded from [Oracle Java Download](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
2. Move `jdk-8u31-linux-x64.gz` distribution to the top level directory of the repository where the `VagrantFile` is located.

### Start the Virtual Machine

The box [puppetlabs/centos-6.5-64-puppet](https://vagrantcloud.com/puppetlabs/boxes/centos-6.5-64-puppet) is required and if not present on the target platoform then it will be downloaded.

1. Use Vagrant to start the virtual machine
     ```
     $ vagrant up
     ```
2. Log into the Virtual Machine
     ```
     $ vagrant ssh
     ```




