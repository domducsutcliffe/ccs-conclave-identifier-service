require 'aws-sdk-ssm'

private

def config_aws
	params_list = ['SITE_24X7_KEY']
	ssm_client = nil
	vcap_services = JSON.parse(ENV['VCAP_SERVICES'])

	vcap_services['user-provided'].each do |user_service|
		if user_service['credentials']['aws_access_key_id'].present?
			ssm_client = Aws::SSM::Client.new(
				region: user_service['credentials']['region'],
				access_key_id: user_service['credentials']['aws_access_key_id'],
				secret_access_key: user_service['credentials']['aws_secret_access_key']
			)
		end
	end

	set_env(ssm_client, params_list) if ssm_client && params_list.any?
end

def set_env(ssm_client, params_list)
	params_list.each do |param_name|
		ENV[param_name] = ssm_client.get_parameter({ name: "/identifier-service/#{param_name}", with_decryption: true })[:parameter][:value]
	end
end

# The following line means that AWS SSM Parameter Store will not be used locally, due to the conditional. You should use a `.env.local` file (do not push) to hold secrets stored in AWS, for local use.
config_aws if ENV['SERVER_ENV_NAME'].present?
