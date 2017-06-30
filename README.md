# Share_data Module

#### Table of Contents

1. [Overview](#overview)
1. [Defined Types](#defined-types)
    * [Share_data](#share_data)
1. [Functions](#functions)
    * [share_data::retrieve()](#share_dataretrieve)

## Overview

This module allowd you to share data with other nodes instead iof only exporting resources.

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

