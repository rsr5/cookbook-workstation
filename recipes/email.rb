
location = "#{Chef::Config['file_cache_path']}/n1.rpm"

# calling rpm command directly to work around:
# https://github.com/nylas/N1/issues/1832
execute 'install n1' do
  command "rpm -Uvh --nodeps #{location}"
  action :nothing
end

remote_file location do
  source 'https://edgehill.nylas.com/download?platform=linux-rpm'
  notifies :run, 'execute[install n1]', :immediately
end
