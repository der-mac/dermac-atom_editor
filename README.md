# Atom-Editor module for puppet

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with atom_editor](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with atom_editor](#beginning-with-atom_editor)
4. [Limitations](#limitations)

## Overview

The atom_editor-module installs the Atom Editor

## Module Description

The atom_editor-module installs the Atom Editor on Windows with the chocolatey-module in silent mode.

## Setup

### Setup Requirements

The atom_editor-module uses the chocolatey-chocolatey module

### Beginning with atom_editor

for a simple atom_editor-installation use:

```puppet
    class { "atom_editor" :
    }
```

##### `package_ensure`
One of the following values:
 * **installed:** Installs the current version
 * **latest:** Installs the current version and updates to every new release
 * **'1.0.0':** Installs a specific version
 * **absent:** Removes the application

##### `package_name`
Name of the package in the os-specific package-manager.
In normal circumstances there is no need to change this value.

##### `prerelease`
Wether or not using the prerelease of the package.
This is not available in all providers.

##### `checksum`
Override the maintainer-provided checksum for the package.
This is not available in all providers.


To install a specific version of atom_editor on Windows and override the maintainers checksum:

```puppet
  class {atom_editor:
    package_ensure => '1.0.7',
    package_name   => ['atom'],
    prerelease     => false,
    checksum       => 'DrI8v9QAHPiPSpM9qfDYvMqrLj3kNV2HiQ0cZOWVUECmJcGqNSBqEiU9V1lArSRvfEUcT2XMSHHMR/WuiUfvrA=='
  }
```

## Limitations

At the Moment, only windows 7 and windows 10 are supported.
