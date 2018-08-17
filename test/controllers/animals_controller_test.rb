require 'test_helper'

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animal = animals(:one)
    @shelter = shelters(:one)
  end

  test "should get index" do
    get animals_url, as: :json
    assert_response :success
  end

  test "should get animals for shelter" do
    get shelter_animals_url(@shelter)
    animals =  JSON.parse response.body

    assert_equal 1, animals.length
  end

  test "should create animal" do
    assert_difference('Animal.count') do

      post animals_url, params: { animal: { image_url: @animal.image_url, medical_condition: @animal.medical_condition, race: @animal.race, shelter_id: @animal.shelter_id, status: @animal.status, temp_name: @animal.temp_name } }, as: :json
    end

    assert_response 201
  end

  test "should show animal" do
    get animal_url(@animal), as: :json
    assert_response :success
  end

  test "should update animal" do

    patch animal_url(@animal), params: { animal: { image_url: @animal.image_url, medical_condition: @animal.medical_condition, race: @animal.race, shelter_id: @animal.shelter_id, status: @animal.status, temp_name: @animal.temp_name } }, as: :json
    assert_response 200
  end

  test "should destroy animal" do
    assert_difference('Animal.count', -1) do
      delete animal_url(@animal), as: :json
    end

    assert_response 204
  end
end
