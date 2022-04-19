module Testing
  class TestingController < ActionController::API
    def return_single_entry
      id = request.query_parameters['id']
      result = Identifier.where(ccs_id: "CCS-#{id}")
      render json: { queried_id: "CCS-#{id}", returned_db_results: result }
    end
  end
end
