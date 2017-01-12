require 'spec_helper'

shared_examples_for 'test_linux' do
  describe "soe" do
    it { is_expected.to satisfy_file_resource_requirements }
    it do
      expect(catalogue.resources.select { |r| r.type == "File" && r[:mode] =~ /777/ }).to be_empty
    end
    it do
      is_expected.to contain_file('/tmp/clowns').with({
        'ensure' => 'file'
      })
    end
  end
end
