
yum_repository 'virtualbox' do
  description 'Fedora $releasever - $basearch - VirtualBox'
  baseurl 'http://download.virtualbox.org/'\
          'virtualbox/rpm/fedora/$releasever/$basearch'
  enabled true
end

package 'VirtualBox-5.0'

execute 'setup vbox driver' do
  command '/usr/lib/virtualbox/vboxdrv.sh'
  action :nothing
end

multipackage 'vbox dependencies' do
  package_name %w(
    binutils
    gcc
    make
    patch
    libgomp
    glibc-headers
    glibc-devel
    kernel-headers
    kernel-devel
    dkms
  )
  notifies :run, 'execute[setup vbox driver]', :immediately
end
