# gcc 4.9.3

directory "/tmp/#{node["common"]["user"]}-uazui/gcc" do
  action :create
end

# build working directory
directory "/tmp/#{node["common"]["user"]}-uazui/gcc/build" do
  action :create
end

directory "/tmp/#{node["common"]["user"]}-uazui/gcc/lib" do
  action :create
end

# TODO
execute "download gmp-4.3.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib"
  command "wget ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2"
  not_if "test -e ./gmp-4.3.2.tar.bz2"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libgmp.so"
end

execute "decompress gmp-4.3.2.tar.bz2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib"
  command "tar xf ./gmp-4.3.2.tar.bz2"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libgmp.so"
end

execute "configure gmp-4.3.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/gmp-4.3.2"
  command "./configure --prefix=#{node["common"]["install_dir"]}"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libgmp.so"
end

execute "build gmp-4.3.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/gmp-4.3.2"
  command "make all -j#{node["common"]["frequency"]}"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libgmp.so"
end

execute "install gmp-4.3.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/gmp-4.3.2"
  command "make install"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libgmp.so"
end

# TODO  
execute "download mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib"
  command "wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2"
  not_if "test -e ./mpfr-2.4.2.tar.bz2"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libmpfr.so"
end

execute "decompress mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib"
  command "tar xf mpfr-2.4.2.tar.bz2"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libmpfr.so"
end

execute "configure mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/mpfr-2.4.2"
  command "./configure --prefix=#{node["common"]["install_dir"]} --with-gmp=#{node["common"]["install_dir"]}"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libmpfr.so"
end

execute "build mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/mpfr-2.4.2"
  command "make all -j#{node["common"]["frequency"]}"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libmpfr.so"
end

execute "install mpfr-2.4.2" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/lib/mpfr-2.4.2"
  command "make install"
  not_if "test -e #{node["common"]["install_dir"]}/lib/libmpfr.so"
end

# danger
execute "append LD_LIBRARY_PATH" do
  command "export LD_LIBRARY_PATH=#{node["common"]["install_dir"]}:$LD_LIBRARY_PATH" 
end

execute "download gcc-4.9.3" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc"
  command "wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-4.9.3/gcc-4.9.3.tar.gz"
  not_if "test -e ./gcc-4.9.3.tar.gz"
  not_if "test -e #{node["common"]["install_dir"]}/bin/gcc"
end

execute "decompress gcc-4.9.3.tar.gz" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc"
  command "tar zxf ./gcc-4.9.3.tar.gz"
  not_if "test -e #{node["common"]["install_dir"]}/bin/gcc"
end

execute "configure gcc-4.9.3" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/build"
  command "../gcc-4.9.3/configure --prefix=#{node["common"]["install_dir"]} --disable-multilib --with-gnu-as --with-as=/usr/local/gnu/bin/as --without-gnu-ld --with-ld=/usr/ccs/bin/ld --with-gmp=#{node["common"]["install_dir"]} --with-mpfr=#{node["common"]["install_dir"]} --enable-shared --enable-languages=c,c++ --without-libiconv-prefix --disable-nls"
  not_if "test -e #{node["common"]["install_dir"]}/bin/gcc"
end

execute "build gcc-4.9.3" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/build"
  command "make -j#{node["common"]["frequency"]}"
  not_if "test -e #{node["common"]["install_dir"]}/bin/gcc"
end

execute "install gcc-4.9.3" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/gcc/build"
  command "make install"
  not_if "test -e #{node["common"]["install_dir"]}/bin/gcc"
end
