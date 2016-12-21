require 'spec_helper'
require 'pry'

shared_examples_for 'test_linux' do
  describe "soe" do
    it do
      expect(catalogue.resources.select { |r| r.type == "File" && r[:mode] =~ /777/ }).to be_empty
    end
    it do
      expect(catalogue).to contain_file('/tmp/clown').with({
        'ensure' => 'file'
      })
    end
  end
end
