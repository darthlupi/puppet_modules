require 'spec_helper'
describe 'tigervnc' do

  context 'with defaults for all parameters' do
    it { should contain_class('tigervnc') }
  end
end
