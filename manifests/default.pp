node default {
  package {'foreman-installer':
    ensure   => installed,
    provider => 'yum',
    require  => [ Package['epel-release'],
                  Package['puppetlabs-release'],
                  Package['foreman-release']]
  }

  package {'epel-release':
    provider => 'rpm',
    source   => 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm'
  }
  package {'puppetlabs-release':
    provider => 'rpm',
    source   => 'http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm'
  }
  package {'foreman-release':
    provider => 'rpm',
    source   => 'http://yum.theforeman.org/releases/1.8/el6/x86_64/foreman-release.rpm'
  }

}
