


want_install_gcc = node["install"]["gcc"] unless node["install"]["gcc"].nil?
is_installed_gcc = File.exist?(node["common"]["install_dir"]+"/bin/gcc")
print is_installed_gcc
