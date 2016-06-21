require 'spec_helper'
describe 'disable_firewall' do

  context 'with defaults for all parameters' do
    it { should contain_class('disable_firewall') }
  end
end
