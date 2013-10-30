require 'spec_helper'

describe package('net-snmp-utils') do
  it { should be_installed }
end

describe package('net-snmp') do
  it { should be_installed }
end

describe file('/etc/snmp/snmpd.conf') do
  it { should be_file }
end
