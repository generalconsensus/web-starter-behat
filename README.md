# behat for Web-Starter

This puppet module is intended to be used with the [Web-Starter package](https://github.com/forumone/web-starter) maintained by Forum One. It will provide a behat server that can run in the vagrant box.

To add this module to a project. First add it to the PuppetFile:

```
mod "generalconsensus/web-starter-behat",
  :git => "https://github.com/generalconsensus/web-starter-behat.git",
  :ref => "master"
```

Rebuild your PuppetFile.lock

Then add the module's classname to the classes hash in your puppet/manifests/hieradata/hosts/[hostname].yaml file

```
classes: 
  - forumone::varnish
  - forumone::nodejs
  - forumone::ruby
  - memcached
  - web-starter-behat
```

