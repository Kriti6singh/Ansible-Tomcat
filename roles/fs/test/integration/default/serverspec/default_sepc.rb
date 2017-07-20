require 'serverspec'

set :backend, :exec

describe file(/opt/tomcat) do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by 'tomcat' }
    it { is_expected.to be_grouped_into 'tomcat' }
end
