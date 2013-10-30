default[:node_name] = node.name
default[:contact_name] = "sumit"
default[:contact_email] = "sumit@codeignition.co"
default[:cidr] =  "10.0.0.0/8"


default[:orion_server][:ipaddress] = "10.130.1.17"
default[:orion_server][:user] = "admin"
default[:orion_server][:password] = "admin"
# node data
default[:orion_agent][:params]["IPAddress"] = node.ipaddress
default[:orion_agent][:params]["Caption"] = node.fqdn
default[:orion_agent][:params]["DynamicIP"] = false
default[:orion_agent][:params]["Allow64BitCounters"] = false
default[:orion_agent][:params]["ObjectSubType"] = "SNMP"
default[:orion_agent][:params]["SNMPVersion"]= 2
default[:orion_agent][:params]["Status"] = 1
default[:orion_agent][:params]["EngineID"] = 1
default[:orion_agent][:params]["UnManaged"] = false
default[:orion_agent][:params]["SysObjectID"] = ""
default[:orion_agent][:params]["MachineType"] = ""
default[:orion_agent][:params]["VendorIcon"] = ""
default[:orion_agent][:params]["Community"] = "public"
