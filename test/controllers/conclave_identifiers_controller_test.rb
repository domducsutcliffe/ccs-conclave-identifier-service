require 'test_helper'

class ConclaveIdentifiersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conclave_identifiers_index_url
    assert_response :success
  end

end
