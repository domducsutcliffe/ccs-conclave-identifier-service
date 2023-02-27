class ConclaveIdentifiersController < ActionController::API
  before_action :validate_params

  def index
    render_response({ response: 'OK' }, 200)
  end

  def generate_id
    "AA1111AA1"
  end

  def validate_params
    params[:id_type] = params[:id_type].to_s.downcase
    return if request.query_parameters.blank?

    render_response({ response: 'Bad Request' }, 400) if request.query_parameters.present? || params.blank?
  end

  def render_response(payload, status_code)
    render json: payload.to_json, status: status_code.to_i
  end
end
