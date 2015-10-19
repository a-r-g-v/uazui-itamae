
directory "/tmp/#{node["common"]["user"]}-uazui/binutils" do
  action :create
end

include_recipe './binutils'
