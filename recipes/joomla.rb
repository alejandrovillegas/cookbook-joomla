bash "install_Joomla" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  echo "Rute"
  mkdir /var/www/html/joomla
  cd /var/www/html/joomla
  wget http://joomlacode.org/gf/download/frsrelease/17410/76021/Joomla_2.5.7-Stable-Full_Package.tar.gz
  tar zxvf Joomla_2.5.7-Stable-Full_Package.tar.gz  -C /var/www/html

  
  EOH
end

ruby_block "edit home s4ds Cheftest.conf" do
  block do
    rc = Chef::Util::FileEdit.new("/etc/rsyslog.conf")
    rc.search_file_replace_line(/# of the default configuration above./,"*.*	@logs.papertrailapp.com:39160")
    rc.write_file
  end
end

service "rsyslog" do
  action :restart
end
