
location = "#{Chef::Config['file_cache_path']}/n1.rpm"

package 'n1' do
  source location
  action :nothing
end

remote_file location do
  source 'https://edgehill.nylas.com/download?platform=linux-rpm'
  notifies :install, 'package[n1]', :immediately
end
