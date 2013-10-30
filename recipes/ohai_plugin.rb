include_recipe "ohai"

template "#{node['ohai']['plugin_path']}/orion.rb" do
  source "plugins/orion.rb.erb"
  owner "root"
  group "root"
  mode 0755
  variables(
    :orion_config_path => node[:orion_agent][:config_path]
  )
end

