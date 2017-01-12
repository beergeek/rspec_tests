require 'spec_helper'
require 'pry'
describe 'rspec_tests' do
  context 'with default values for all parameters' do
    let(:facts) do
      {
        :osfamily => 'RedHat',
      }
    end
    it_behaves_like 'test_linux'
    it do should contain_class('rspec_tests') end
    it do
      is_expected.to contain_file('/tmp/test').with({
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0777',
      })
    end
  end
end
