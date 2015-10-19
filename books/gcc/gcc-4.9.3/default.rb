
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

# gmp
is_installed_gmp = File.exist?(node["common"]["install_dir"]+"/lib/libgmp.so")
include_recipe "./gmp" unless is_installed_gmp

# mpfr
is_installed_mpfr = File.exist?(node["common"]["install_dir"]+"/lib/libmpfr.so")
include_recipe "./mpfr" unless is_installed_mpfr

# danger TODO: add only if(already contains check)
execute "append LD_LIBRARY_PATH" do
  command "export LD_LIBRARY_PATH=#{node["common"]["install_dir"]}:$LD_LIBRARY_PATH" 
end


include_recipe "./gcc"
