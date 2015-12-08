# motd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with motd](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs you a nice looking motd. An additional script in /etc/profile.d
will be added and the motd script itself (/usr/local/bin).

## Module Description

The module consists of 2 templates, the motd script itself and the profile script which
will be added to the /etc/profile.d/ directory. This script was mainly used in a foreman environment.

## Setup

### Beginning with motd

`include '::motd'` is enough to get you up and running. There are 2 parameters which can
be set individually. Once the 'important' parameter, which adds basic information at the
end of the MOTD. The second parameter which you can set is 'packages' where you can specify
packages which have been installed on this specific server. Further details about the 
packages will be added to the MOTD using 'rpm -q'.

```puppet
class { '::motd':
  packages  => [ 'puppet nfs-utils htop' ],
  important => [ 'This server is using prod envrionment for python!' ]
}
```

## Usage

All interaction with the motd module can be done through the main motd class.


```puppet
class { '::motd':
  packages  => [ 'puppet nfs-utils htop' ],
  important => [ 'This server is using prod envrionment for python!' ]
}
```

### Dynamic values

Partitions and NICs will be autodetected and displayed dynamically. Here some examples:
Partitions:
`◢ PARTITION INFO ◣ `
`► Partition /dev/mapper/vg_ngmserver-lv_root:`
`  Size   Free    Used    Mount`
`  4.8G   4.2G    430M    /`
`► Partition /dev/mapper/vg_ngmserver-lv_var:`
`  Size   Free    Used    Mount`
`  20G    19G     440M    /var`
NICs:
`◢ NETWORK INFO ◣`
`► Interface eth0......: 192.168.1.10/24`
`► Interface eth1......: 192.168.2.10/24`

### Colored important values

In order to identify very quickly important values, the following values will be shown in 3
different colors (green = good, yellow = warning, red = critical):
- CPU load
- Memory usage
- Partitions

For the CPU load, the color will be changed to yellow whenever the load is higher then the
half of your CPU cores. The color will be changed to red whenever the load is higher than
your amount of CPU cores.

For the memory usage, the colow will be changed to yellow whenever the memory hits 80% of 
the entire memory size and above. The color will be changed to red whenever the memory hits
90% of the entire memory size and above.

For the partitions, the color will be changed to yellow whenever the used space hits 80% of
the partition size and above. The color will be changed to red whenever the used space hits
90% of the partiton size and above.

## Reference

## Limitations

This script fully compatible and tested on CentOS 5,6 and RedHat 5,6. If you try this module
on a different OS, please let me know if everything is working fine.

## Development

For any updates / improvements / suggestions or just feedback, please let me know:
puppet [at] fnx.lu

## Change-log

v1.1.0
- mode detailed README file.
- fixing code quality
