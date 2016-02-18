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
  - web-starter-behat::behat
```

That should be it. You will be able to run your behat server and run behat tests that require Javascript execution. You will need to run two shell windows, one to run the behat server, which can be started with the command:

```
DISPLAY=:1 xvfb-run --server-args="-screen 0 1280x1024x8" java -jar /opt/behat-server-standalone-2.45.0.jar &
```
