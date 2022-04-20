require 'test_helper'

class IdentifiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @identifier = identifiers(:one)
  end

  test "should create a new identifier" do
    get '/identifiers/id/conclave'
    assert_response :created
  end

  test "should create two new identifiers" do
    get '/identifiers/id/conclave?count=2'
    assert_response :created
  end

  test "should return bad request for incorrect query param" do
    get '/identifiers/id/conclave?ct=2'
    assert_response :bad_request
  end

  # test "should create identifier" do
  #   assert_difference('Identifier.count') do
  #     get '/identifiers/id/conclave', params: { count: 3 }
  #   end

  #   assert_redirected_to identifier_url(Identifier.last)
  # end
end
