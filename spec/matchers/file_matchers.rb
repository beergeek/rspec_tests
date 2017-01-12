RSpec::Matchers.define :satisfy_file_resource_requirements do
  match do |catalog|
    @missing_param = catalogue.resources.map do |resource|
      next if !(resource.type == 'File' and resource.tags.include?(class_name))
      [:owner, :group, :mode].map do |param|
        if resource[param].nil? or resource[param].empty?
          "Found unstatisifed file resource #{resource}, missing: #{param}"
        elsif param == :mode
          if resource[param] =~ /777|\d.*7$/
            "Found use of unsafe file mode for file #{resource}, mode: #{resource[param]}"
          end
        end
      end.flatten(1)
    end.flatten(1).compact
    @missing_param.empty?
  end
  failure_message do |str|
    @missing_param.join("\n")
  end
end
