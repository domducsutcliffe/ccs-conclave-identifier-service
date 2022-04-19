class ConclaveIdentifiersController < ActionController::API
  before_action :validate_params

  def index
    render_response(response_payload, 201)
  end

  def response_payload(count = 1)
    n = 0
    identifiers = []
    count = request.query_parameters['count'].to_i if request.query_parameters.present?

    while n < count
      id = generate_id
      identifiers << {
        id: "CCS-#{id}",
        id_type: 'conclave',
        persisted: false
      }

      Identifier.new(ccs_id: "CCS-#{id}", id_type: 'conclave', ccs_persisted: false).save
      n += 1
    end

    { identifiers: identifiers }
  end

  def generate_id
    id = ''

    loop do
      id = ApplicationHelper::IdentifiersHelper.generate_id
      result = Identifier.where(ccs_id: "CCS-#{id}")
      break if result.count.zero? && id.to_s.length == 6
    end

    return id if id
  end

  def validate_params
    return if request.query_parameters.blank?

    render_response({ error: 'bad_request' }, 400) if request.query_parameters['count'].blank? || request.query_parameters['count'].to_i < 1
  end

  def render_response(payload, status_code)
    render json: payload.to_json, status: status_code.to_i
  end
end
