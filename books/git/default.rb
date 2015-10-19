## Require, books/gcc


directory "/tmp/#{node["common"]["user"]}-uazui/git" do
  mode '0755'
  user node["common"]["user"]
  action :create
end

directory "/tmp/#{node["common"]["user"]}-uazui/openssl" do
  mode '0755'
  user node["common"]["user"]
  action :create
end

execute "get source code" do
  user node["common"]["user"]
  command "wget -P /tmp/#{node["common"]["user"]}-uazui/git"
end
