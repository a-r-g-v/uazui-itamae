
# TODO
execute "download gmp-4.3.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib"
  command "wget ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2"
  not_if "test -e ./gmp-4.3.2.tar.bz2"
end

execute "decompress gmp-4.3.2.tar.bz2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib"
  command "tar xf ./gmp-4.3.2.tar.bz2"
end

execute "configure gmp-4.3.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/gmp-4.3.2"
  command "./configure --prefix=#{node["common"]["install_dir"]}"
end

execute "build gmp-4.3.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/gmp-4.3.2"
  command "make all -j#{node["common"]["frequency"]}"
end

execute "install gmp-4.3.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/gmp-4.3.2"
  command "make install"
end

