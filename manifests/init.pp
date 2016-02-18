class web-starter-behat::behat ($version = '2.5') {

  include forumone::composer

  $path = "${path}/tests/behat/"
  $composer_lock = "${path}/test/behat/composer.lock"

  if $path and $vagrant {
    file { $vagrant:
      ensure  => present,
      owner   => "vagrant",
      group   => "vagrant",
      mode    => "644",
    }

    file { $path:
      ensure  => present,
      owner   => "vagrant",
      group   => "vagrant",
      mode    => "644"
    }

    file { "$path/files":
      ensure  => present,
      owner   => "vagrant",
      group   => "vagrant",
      mode    => "644"
    }

    file { "$path/test_results":
      ensure  => present,
      owner   => "vagrant",
      group   => "vagrant",
      mode    => "644"
    }

    file { "$path/composer.json":
      ensure  => present,
      owner   => "vagrant",
      group   => "vagrant",
      mode    => "644",
      content => inline_template(file("/etc/puppet/modules/web-starter-behat/templates/behat/composer.json.erb"))
    }

    exec { 'forumone::behat::composer':
      command     => "composer install",
      cwd         => $path,
      path        => ['/usr/bin', '/user/local/bin'],
      creates     => $composer_lock,
      require     => [Class['forumone::composer']],
      environment => ["COMPOSER_HOME=${::forumone::composer::home}"],
      user        => $::forumone::composer::user,
    }
  }

}
