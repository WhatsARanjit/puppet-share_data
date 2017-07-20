# share_data

#### Table of Contents

1. [Overview](#overview)
1. [Example](#example)
1. [Defined Types](#defined-types)
    * [Share_data](#share_data)
1. [Functions](#functions)
    * [share_data::retrieve()](#share_dataretrieve)

## Overview

This module allowd you to share data with other nodes instead iof only exporting resources.

## Example

#### Node sending data

```
share_data { $fqdn:
  data  => [ $hostname, $ipaddress ],
  label => 'foobar',
}
```

#### Node using data

```
$data = share_data::retrieve('foobar')

$data.each |$item| {
  host { $item[0]:
    ensure => present,
    ip     => $item[1],
  }
}

file { '/tmp/mywhitelist.txt':
  ensure  => file,
  content => inline_template('<% @data.each do |val| %><%= val[0] %>:<%= val[1] %><% end %>'),
}
```

This will create host entries for each node and a file with content like:

```
node1: 192.168.1.1
node2: 192.168.1.2
node3: 192.168.1.3
```

## Defined Types

### Share_data

Used to ship data to the master.

#### Share_data parameters

* `label`

  Basically a tag used to call upon specific data later.  _Required_

* `data`

  What you want to share.  Can be any type- `String`, `Array`, `Hash`, etc. 
  Default: `$title`

## Functions

### share_data::retrieve()

#### share_data::retrieve inputs

* `label`

  The label used to mark the data you want to retrieve.  This function will 
return an `Array` of matching `share_data` items.

