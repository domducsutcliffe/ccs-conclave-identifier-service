require 'erb'

# Load the ERB template
template = ERB.new(File.read("#{Rails.root}/apminsight.conf.erb"))

# Render the template with the current binding
result = template.result(binding)

# Write the result to the apminsight.conf file
File.write("#{Rails.root}/apminsight.conf", result)

# conf_file_path = "#{Rails.root}/apminsight.conf"

# if !File.exists?(conf_file_path)
#   # Load the ERB template
#   template = ERB.new(File.read("#{Rails.root}/apminsight.conf.erb"))

#   # Render the template with the current binding
#   result = template.result(binding)

#   # Write the result to the apminsight.conf file
#   File.write(conf_file_path, result)
# end