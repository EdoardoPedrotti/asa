require 'test_helper'

class SheltersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shelter = shelters(:one)
    @animal = animals(:one)
  end

  test "should get index" do
    get shelters_url, as: :json
    assert_response :success
  end

  test "should create shelter" do
    assert_difference('Shelter.count') do
      post shelters_url, params: { shelter: { location: @shelter.location, name: @shelter.name } }, as: :json
    end

    assert_response 201
  end

  test "should show shelter" do
    get shelter_url(@shelter), as: :json
    assert_response :success
  end

  test "should update shelter" do
    patch shelter_url(@shelter), params: { shelter: { location: @shelter.location, name: @shelter.name } }, as: :json
    assert_response 200
  end

  test "should destroy shelter" do
    assert_difference('Shelter.count', -1) do
      delete shelter_url(@shelter), as: :json
    end

    assert_response 204
  end

  test "should remove animal from shelter list" do
   assert_difference('@shelter.animals.count', -1) do
    delete shelter_animal_remove_url(@shelter, @animal), as: :json
    assert_response 200
   end
    
  end

end
