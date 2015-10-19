execute "download mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib"
  command "wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2"
  not_if "test -e ./mpfr-2.4.2.tar.bz2"
end

execute "decompress mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib"
  command "tar xf mpfr-2.4.2.tar.bz2"
end

execute "configure mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/mpfr-2.4.2"
  command "./configure --prefix=#{node["common"]["install_dir"]} --with-gmp=#{node["common"]["install_dir"]}"
end

execute "build mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/mpfr-2.4.2"
  command "make all -j#{node["common"]["frequency"]}"
end

execute "install mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/mpfr-2.4.2"
  command "make install"
end

