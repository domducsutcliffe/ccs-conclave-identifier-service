require 'erb'

# Load the ERB template
template = ERB.new(File.read("#{Rails.root}/apminsight.conf.erb"))

# Render the template with the current binding
result = template.result(binding)

# Write the result to the apminsight.conf file
File.write("#{Rails.root}/apminsight.conf", result)