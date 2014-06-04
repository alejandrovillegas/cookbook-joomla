bash "install_Joomla" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget http://joomlacode.org/gf/download/frsrelease/17410/76021/Joomla_2.5.7-Stable-Full_Package.tar.gz
  tar zxvf Joomla_2.5.7-Stable-Full_Package.tar.gz  -C /var/www/html
  cd /var/www/html/Joomla_2.5.7-Stable-Full_Package
  ./configure
  make install
  EOH
end
