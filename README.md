Introduction
============
Stuff I use to setup a fresh development vagrant VM.

Pre-Requisites
==============
* [vagrant](http://vagrantup.com)
* vagrant plugins
    * `vagrant plugin install vagrant-omnibus`
    * `vagrant plugin install vagrant-berkshelf`
* `gem install bundler`
* dotfiles available as a homesick castle; [for example](https://github.com/sajnikanth/castle)
* ssh keys are at `~/.ssh/` and added to ssh-agent (perhaps via `.bash_profile`). Refer to [this page](https://help.github.com/articles/using-ssh-agent-forwarding) for more info on ssh agent forwarding

Setup
=====
* Clone and go to this repo  - `git clone git@github.com:sajnikanth/vagrant.git && cd vagrant`
* `bundle install`
* `berks install`
* update your castle repo in `data_bag/users/vagrant.json`
* Choose your VM box, shared folders among other options in `Vagrantfile`
* Choose the roles and recipes you want to run in `Vagrantfile`
* `vagrant up`

Enjoy your shiny new VM
