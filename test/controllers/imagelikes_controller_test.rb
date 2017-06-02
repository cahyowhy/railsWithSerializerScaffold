require 'test_helper'

class ImagelikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imagelike = imagelikes(:one)
  end

  test "should get index" do
    get imagelikes_url, as: :json
    assert_response :success
  end

  test "should create imagelike" do
    assert_difference('Imagelike.count') do
      post imagelikes_url, params: { imagelike: { imagepost_id: @imagelike.imagepost_id, user_id: @imagelike.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show imagelike" do
    get imagelike_url(@imagelike), as: :json
    assert_response :success
  end

  test "should update imagelike" do
    patch imagelike_url(@imagelike), params: { imagelike: { imagepost_id: @imagelike.imagepost_id, user_id: @imagelike.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy imagelike" do
    assert_difference('Imagelike.count', -1) do
      delete imagelike_url(@imagelike), as: :json
    end

    assert_response 204
  end
end
