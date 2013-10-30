action :install do
  ruby_block "add in orion server" do
    block do
      require 'rubygems'
      require 'rest_client'

      data = {"IPAddress"=> "10.130.1.51",
              "Caption"=> "law",
              "DynamicIP"=> false,
              "Allow64BitCounters"=> false,
              "ObjectSubType"=> "SNMP",
              "SNMPVersion"=> 2,
              "Status" => 1,
              "EngineID" => 1,
              "UnManaged" => false,
              "SysObjectID" => "",
              "MachineType" => "",
              "VendorIcon" => "",
              "Community"=> "public"
      }


      require 'base64'
      auth = 'Basic ' + Base64.encode64( "admin" ).chomp

      p data.to_json
      orion_api_url = "https://admin:admin@10.130.1.17:17778/SolarWinds/InformationService/v3/Json/Create/Orion.Nodes"

      begin
        rest = RestClient.post orion_api_url, data.to_json, :accept => :json , :content_type => :json
        p rest
      rescue Exception => e
        p e
        require 'pry'; binding.pry
      end

    end
  end
end
