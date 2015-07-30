node default {
  class { '::puppet':
    server          => true,
    server_git_repo => true,
    require         => Yumrepo['epel']
  }

  yumrepo { 'epel':
      mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
      descr      => 'Extra Packages for Enterprise Linux 6',
      enabled    => 1,
      gpgcheck   => 0
  }
}
