require 'serverspec'

set :backend, :exec

tomcat_version = '8.5.14'

describe package('java-1.8.0-openjdk.x86_64') do
  it { should be_installed }
end

describe user('tomcat') do
  it { should exist }
end

describe group('tomcat') do
  it { should exist }
end

describe file('/opt/apache-tomcat-{tomcat_version}') do
  it { should be_directory }
  it { should be_owned_by 'tomcat' }
end

describe file('/opt/tomcat/tomcat/conf/server.xml') do
  it { should be_file }
  it { should be_owned_by 'tomcat' }
end

describe file('/opt/tomcat/tomcat/conf/web.xml') do
  it { should be_file }
  it { should be_owned_by 'tomcat' }
end

describe file('/opt/tomcat/tomcat/conf/context.xml') do
  it { should be_file }
  it { should be_owned_by 'tomcat' }
end

describe file('/usr/lib/systemd/system/tomcat.service') do
  it { should be_file }
  it { should be_owned_by 'root' }
end

describe file('/opt/tomcat/webapps/ROOT/index.html') do
  it { should be_file }
  it { should be_owned_by 'tomcat' }
end

describe file('') do
  it { should be_file }
  it { should be_owned_by 'root' }
end

describe service('tomcat') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(8080) do
  it { should be_listening }
end

