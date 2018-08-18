require 'test_helper'

class AdoptionRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adoption_request = adoption_requests(:one)
    @shelter = shelters(:one)
  end

  test "should get index" do
    get adoption_requests_url, as: :json
    assert_response :success
  end

  test "should create adoption_request" do
    assert_difference('AdoptionRequest.count') do
      post adoption_requests_url, params: { adoption_request: { animal_id: @adoption_request.animal_id, user_id: @adoption_request.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show adoption_request" do
    get adoption_request_url(@adoption_request), as: :json
    assert_response :success
  end

  test "should update adoption_request" do
    patch adoption_request_url(@adoption_request), params: { adoption_request: { animal_id: @adoption_request.animal_id, user_id: @adoption_request.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy adoption_request" do
    assert_difference('AdoptionRequest.count', -1) do
      delete adoption_request_url(@adoption_request), as: :json
    end

    assert_response 204
  end

  test "should get shelter requests" do
    get adoption_requests_shelter_url(@shelter), as: :json
    reqs = JSON.parse response.body
    assert_equal 1, reqs.length
  end

end
