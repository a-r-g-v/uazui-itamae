# 
execute "download git-2.6.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/"
  command "https://github.com/git/git/archive/v2.6.1.tar.gz"
  not_if "test -e ./v2.6.1.tar.gz"
end

execute "decompress git-2.6.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/"
  command "tar xf ./v2.6.1.tar.gz"
end

execute "remove config.mak.uname" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/git-2.6.1/"
  command "rm config.mak.uname"
end

remote_file "put config.mak.uname" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/git-2.6.1/"
  path "config.mak.uname"
  source "misc/config.mak.uname"
end

execute "configure git-2.6.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/git-2.6.1/"
  command "./configure --prefix=#{node["common"]["install_dir"]}"
end
execute "build git-2.6.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/git-2.6.1/"
  command "make all -j#{node["common"]["frequency"]}"
end

execute "install git-2.6.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/git-2.6.1/"
  command "make install"
end

