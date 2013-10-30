action :install do

  directory "/var/orion/" do
    action :create
  end

  ruby_block "add in orion server" do
    block do
      require 'rubygems'
      require 'rest_client'
      orion_server = node[:orion_server]
      orion_api_url = "https://#{orion_server[:user]}:#{orion_server[:password]}@#{orion_server[:ipaddress]}:17778/SolarWinds/InformationService/v3/Json/Create/Orion.Nodes"
      data = node[:orion_agent][:params].to_hash
      Chef::Log.info("Configuring node in orion server with params: #{data}")
      begin
        rest = RestClient.post orion_api_url, data.to_json, :accept => :json , :content_type => :json
      rescue Exception => e
        Chef::Log.error("error occurred while configuring node: #{e.message}")
      end
    end
  end
end
