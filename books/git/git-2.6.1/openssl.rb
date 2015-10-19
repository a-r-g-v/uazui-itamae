
execute "download openssl-1.0.1p" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/lib"
  command "https://www.openssl.org/source/openssl-1.0.1p.tar.gz"
  not_if "test -e ./openssl-1.0.1p.tar.gz"
end

execute "decompress openssl-1.0.1p" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/lib"
  command "tar xf ./openssl-1.0.1p.tar.gz"
end

#TODO: vaild solaris-x86-gcc? why x86?
execute "configure openssl-1.0.1p" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/lib/openssl-1.0.1p"
  command "./Configure --prefix=#{node["common"]["install_dir"]} solaris-x86-gcc"
end

execute "build openssl-1.0.1p" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/lib/openssl-1.0.1p"
  command "make all -j#{node["common"]["frequency"]}"
end

execute "install openssl-1.0.1p" do
  cwd "/tmp/#{node["common"]["user"]}-uazui/git/lib/openssl-1.0.1p"
  command "make install"
end

