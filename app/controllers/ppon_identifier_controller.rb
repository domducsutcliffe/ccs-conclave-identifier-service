require_relative '../../helpers/application_helper'

class PponIdentifierController < ActionController::API
  before_action :validate_params

  def index
    render_response({ response: 'OK' }, 200)
  end

  def return_a_ppon_id
    return Helpers::ApplicationHelper.generate_specific_ppon_id(0)
  end

  def validate_params
    return if request.query_parameters.blank?

    render_response({ response: 'Bad Request' }, 400) if request.query_parameters.present? || params.blank?
  end

  def render_response(payload, status_code)
    render json: payload.to_json, status: status_code.to_i
  end
end
