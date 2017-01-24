require 'test_helper'

class RatingCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating_comment = rating_comments(:one)
  end

  test "should get index" do
    get rating_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_rating_comment_url
    assert_response :success
  end

  test "should create rating_comment" do
    assert_difference('RatingComment.count') do
      post rating_comments_url, params: { rating_comment: { body: @rating_comment.body, rating_id: @rating_comment.rating_id, user_id: @rating_comment.user_id } }
    end

    assert_redirected_to rating_comment_url(RatingComment.last)
  end

  test "should show rating_comment" do
    get rating_comment_url(@rating_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_rating_comment_url(@rating_comment)
    assert_response :success
  end

  test "should update rating_comment" do
    patch rating_comment_url(@rating_comment), params: { rating_comment: { body: @rating_comment.body, rating_id: @rating_comment.rating_id, user_id: @rating_comment.user_id } }
    assert_redirected_to rating_comment_url(@rating_comment)
  end

  test "should destroy rating_comment" do
    assert_difference('RatingComment.count', -1) do
      delete rating_comment_url(@rating_comment)
    end

    assert_redirected_to rating_comments_url
  end
end
