#
# Cookbook Name:: orion_cookboook 
# Recipe:: default
#
# Copyright (C) 2013 timusg
# 
# All rights reserved - Do Not Redistribute
#

package "net-snmp-utils" do
  action :install
end

package  "net-snmp" do
  action :install
end

template "/etc/snmp/snmpd.conf" do
  source "snmpd.conf.erb"
  variables(
            :cidr => node[:cidr],
            :node_name => node[:node_name],
            :contact_name =>node[:contact_name],
            :contact_email => node[:contact_email]
           )
end

p node

orion_cookboook_orion_agent "apply" do
  action :install
end
