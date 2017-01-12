require 'puppetlabs_spec_helper/module_spec_helper'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'metadata-json-lint/rake_task'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-utils'
require 'matchers/file_matchers.rb'
require 'utils/helpers.rb'
RSpec.configure do |c|
  c.hiera_config = 'spec/fixtures/hiera/hiera.yaml'
  c.before :each do
    # Ensure that we don't accidentally cache facts and environment
    # between test cases.
    Facter::Util::Loader.any_instance.stubs(:load_all)
    Facter.clear
    Facter.clear_messages
  end
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!()
  end
end
