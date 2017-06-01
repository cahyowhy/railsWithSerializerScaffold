require 'test_helper'

class ImagecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imagecomment = imagecomments(:one)
  end

  test "should get index" do
    get imagecomments_url, as: :json
    assert_response :success
  end

  test "should create imagecomment" do
    assert_difference('Imagecomment.count') do
      post imagecomments_url, params: { imagecomment: { comment: @imagecomment.comment, imagepost_id: @imagecomment.imagepost_id, user_id: @imagecomment.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show imagecomment" do
    get imagecomment_url(@imagecomment), as: :json
    assert_response :success
  end

  test "should update imagecomment" do
    patch imagecomment_url(@imagecomment), params: { imagecomment: { comment: @imagecomment.comment, imagepost_id: @imagecomment.imagepost_id, user_id: @imagecomment.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy imagecomment" do
    assert_difference('Imagecomment.count', -1) do
      delete imagecomment_url(@imagecomment), as: :json
    end

    assert_response 204
  end
end
