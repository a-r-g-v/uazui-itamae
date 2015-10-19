
# installed_check

is_installed_gcc = File.exist?(node["common"]["install_dir"]+"/bin/gcc")
is_installed_binutils = File.exist?(node["common"]["install_dir"]+"/bin/objdump")
is_installed_git = File.exist?(node["common"]["install_dir"]+"/bin/git")

# include_recipe

## gcc
include_recipe "./books/gcc" if node['install']['gcc'] and !is_installed_gcc

## binutils
include_recipe "./books/binutils" if node['install']['binutils'] and !is_installed_binutils

## git
include_recipe "./books/git" if node['install']['binutils'] and !is_installed_git

print "Please, Delete working directory path: /tmp/#{node["common"]["user"]}-uazui/"
