
directory "/tmp/#{node["common"]["user"]}-uazui/git" do
  action :create
end

directory "/tmp/#{node["common"]["user"]}-uazui/git/lib" do
  action :create
end

# openssl 
is_installed_openssl = File.exist?(node["common"]["install_dir"]+"/bin/openssl")
include_recipe './openssl' unless is_installed_openssl

include_recipe './git'
