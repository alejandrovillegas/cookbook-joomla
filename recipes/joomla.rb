
ruby_block "edit home s4ds rsyslog.conf" do
  block do
    rc = Chef::Util::FileEdit.new("/etc/rsyslog.conf")
    rc.search_file_replace_line(/# of the default configuration above./,"*.*	@logs.papertrailapp.com:39160")
    rc.write_file
  end
end

service "rsyslog" do
  action :restart
end

gem_package 'remote_syslog'


bash "Config-syslog" do
  user "root"
  cwd "/tmp"
  code <<-EOH
	  sudo gem install remote_syslog
	  remote_syslog -p 39160 -d logs.papertrailapp.com/path/to/access_log
  EOH
end
