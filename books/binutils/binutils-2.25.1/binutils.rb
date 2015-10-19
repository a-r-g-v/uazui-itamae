
execute "download binutils-2.25.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/binutils"
  command "wget http://ftp.gnu.org/gnu/binutils/binutils-2.25.1.tar.gz"
  not_if "test -e ./binutils-2.25.1.tar.gz"
end

execute "decompress binutils-2.25.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/binutils"
  command "tar zxvf binutils-2.25.1.tar.gz"
end

execute "configure binutils-2.25.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/binutils/binutils-2.25.1"
  command "./configure --prefix=#{node["common"]["install_dir"]}"
end

execute "build binutils-2.25.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/binutils/binutils-2.25.1"
  command "make all -j#{node["common"]["frequency"]}"
end

execute "install binutils-2.25.1" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/binutils/binutils-2.25.1"
  command "make install"
end

