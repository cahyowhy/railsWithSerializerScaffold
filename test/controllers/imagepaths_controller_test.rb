require 'test_helper'

class ImagepathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imagepath = imagepaths(:one)
  end

  test "should get index" do
    get imagepaths_url, as: :json
    assert_response :success
  end

  test "should create imagepath" do
    assert_difference('Imagepath.count') do
      post imagepaths_url, params: { imagepath: { imagepost_id: @imagepath.imagepost_id, path: @imagepath.path } }, as: :json
    end

    assert_response 201
  end

  test "should show imagepath" do
    get imagepath_url(@imagepath), as: :json
    assert_response :success
  end

  test "should update imagepath" do
    patch imagepath_url(@imagepath), params: { imagepath: { imagepost_id: @imagepath.imagepost_id, path: @imagepath.path } }, as: :json
    assert_response 200
  end

  test "should destroy imagepath" do
    assert_difference('Imagepath.count', -1) do
      delete imagepath_url(@imagepath), as: :json
    end

    assert_response 204
  end
end
