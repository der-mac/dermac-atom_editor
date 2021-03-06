# == Class: atom_editor::install
#
# This is the install-class to install the atom editor
#
# === Parameters
#
# See the init-class.
#
# === Variables
#
# === Examples
#
# === Authors
#
# Martin Schneider <martin@dermac.de>
#
# === Copyright
#
# Copyright 2017 Martin Schneider
#
class atom_editor::install inherits atom_editor {

  case $::os['name'] {
    'windows': {
      case $::os['release']['full'] {
        '7', '10': {
          # ensure chocolatey is installed and configured
          include chocolatey

          # Initialise Install-Options-Array
          $install_options_0 = []
          if ($atom_editor::prerelease) {
            $install_options_1 = concat($install_options_0, '-pre')
          }
          else {
            $install_options_1 = $install_options_0
          }
          if ($atom_editor::checksum) {
            $install_options_2 = concat($install_options_1, ['--download-checksum', $atom_editor::checksum])
          }
          else {
            $install_options_2 = $install_options_1
          }
          $install_options = $install_options_2

          package { $atom_editor::package_name:
            ensure            => $atom_editor::package_ensure,
            provider          => 'chocolatey',
            install_options   => $install_options,
            uninstall_options => ['-r'],
          }
        }
        default: {
          fail("The ${module_name} module is not supported on Windows Version ${::operatingsystemmajrelease} based system.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
