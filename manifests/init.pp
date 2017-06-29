# == Class: atom_editor
#
# Install and configure the atom editor (https://atom.io/).
#
# === Parameters
#
# [*package_ensure*]
#   One of the following values
#   installed|latest|'1.0.0'|absent
# [*$package_name*]
#   Name of the package in the operatingsystem, or in case of Windows
#   the packagename in chocolatey
# [*$prerelease*]
#   If supported you can install a prerelease
#   (for example on windows/chocolatey an uploaded but not approved version)
#   true|false
# [*$checksum*]
#   If supported you can overwrite the checksum of the downloaded file
#   (for example on windows/chocolatey you can overwrite the checksum
#   provided by the maintainer)
#
# === Variables
#
# === Examples
#
#  class { 'atom_editor': }
#
# === Authors
#
# Martin Schneider <martin@dermac.de>
#
# === Copyright
#
# Copyright 2017 Martin Schneider
#
class atom_editor (
  $package_ensure     = $atom_editor::params::package_ensure,
  $package_name       = $atom_editor::params::package_name,
  $prerelease         = $atom_editor::params::prerelease,
  $checksum           = $atom_editor::params::checksum,
) inherits atom_editor::params {

  validate_array($package_name)
  validate_bool($prerelease)

  anchor { 'atom_editor::begin': }
  -> class { '::atom_editor::install': }
  -> class { '::atom_editor::config': }
  anchor { 'atom_editor::end': }
}
