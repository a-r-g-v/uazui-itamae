# gcc 4.9.3

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
