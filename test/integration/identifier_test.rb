require 'test_helper'

class IdentifierTest < ActionDispatch::IntegrationTest
  test 'can get identifiers' do
    get '/identifiers/id/conclave'
    assert_response :created

    get '/identifiers/id/conclave?count=2'
    assert_response :created
    # assert_select {'identifiers':[{'id':'CCS-484902','id_type':'conclave','persisted':false},{'id':'CCS-636904','id_type':'conclave','persisted':false}]}
  end
end
