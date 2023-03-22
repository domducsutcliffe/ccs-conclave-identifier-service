module Authorize
  module Token
    def api_key_to_string
      if request.headers['x-api-key'].present?
        request.headers['x-api-key'].to_s
      end
    end

    def client_auth
      Client.find_by(api_key: api_key_to_string)
    end

    def authenticate_api_key
      true if client_auth && client_auth.present?
    end

    def validate_api_key
      render json: 'API key not provided, or incorrect.', status: :unauthorized unless authenticate_api_key
    end
  end
end
