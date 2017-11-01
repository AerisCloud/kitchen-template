require_relative 'spec_helper'

SERVICE_USER  = 'user'
SERVICE_GROUP = 'group'
SERVICE_PORTS = [80]

describe service('something') do
	it { should be_enabled }
	it { should be_running }
end

describe file('/some/file') do
	it { should exist }
	it { should be_file }
	it { should be_owned_by SERVICE_USER }
	it { should be_grouped_into SERVICE_GROUP }
	it { should be_mode 640 }
end

describe file('/some/folder') do
	it { should exist }
	it { should be_directory }
	it { should be_owned_by SERVICE_USER }
	it { should be_grouped_into SERVICE_GROUP }
	it { should be_mode 750 }
end

SERVICE_PORTS.each do |service_port|
	describe port(service_port) do
		it { should be_listening }
	end
end