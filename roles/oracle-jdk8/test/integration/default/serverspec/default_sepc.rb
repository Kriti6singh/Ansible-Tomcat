require 'serverspec'

set :backend, :exec

describe file ('/usr/bin/java') do
  it {should exist}
  it {should be_mode 777}
end
describe command ('java -version') do
  its(:stdout) { should contain(/java version "1.8.0_45"/) }
end
