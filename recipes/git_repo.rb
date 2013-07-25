#
# Cookbook Name:: development
# Recipe:: default
#
# Copyright (C) 2013 Sajnikanth Suriyanarayanan
#
#
git "Checkout Code" do
    repository "git://github.com/sajnikanth/castle.git"
    reference "master"
    action :checkout
    destination "/home/vagrant/sample_repo
end
