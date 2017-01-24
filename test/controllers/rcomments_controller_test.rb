require 'test_helper'

class RcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rcomment = rcomments(:one)
  end

  test "should get index" do
    get rcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_rcomment_url
    assert_response :success
  end

  test "should create rcomment" do
    assert_difference('Rcomment.count') do
      post rcomments_url, params: { rcomment: { body: @rcomment.body, rating_id: @rcomment.rating_id, user_id: @rcomment.user_id } }
    end

    assert_redirected_to rcomment_url(Rcomment.last)
  end

  test "should show rcomment" do
    get rcomment_url(@rcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_rcomment_url(@rcomment)
    assert_response :success
  end

  test "should update rcomment" do
    patch rcomment_url(@rcomment), params: { rcomment: { body: @rcomment.body, rating_id: @rcomment.rating_id, user_id: @rcomment.user_id } }
    assert_redirected_to rcomment_url(@rcomment)
  end

  test "should destroy rcomment" do
    assert_difference('Rcomment.count', -1) do
      delete rcomment_url(@rcomment)
    end

    assert_redirected_to rcomments_url
  end
end
