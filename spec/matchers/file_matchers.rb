RSpec::Matchers.define :satisfy_file_resource_requirements do
  match do |catalog|
    @missing_param = catalogue.resources.map do |resource|
      next if resource.type != 'File'
      [:owner, :group, :mode].map do |param|
        if resource[param].nil? or resource[param].empty?
          "Found unstatisifed file reosurce #{resource}, missing: #{param}"
        end
      end.flatten(1)
    end.flatten(1).compact
    @missing_param.empty?
  end
  failure_message do |str|
    @missing_param.join("\n")
  end
end
