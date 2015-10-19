
# installed_check

is_installed_gcc = File.exist?(node["common"]["install_dir"]+"/bin/gcc")

# include_recipe

## gcc
include_recipe "./books/gcc" if node['install']['gcc'] and !is_installed_gcc
