require 'test_helper'

class SkinewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skinews = skinews(:one)
  end

  test "should get index" do
    get skinews_url
    assert_response :success
  end

  test "should get new" do
    get new_skinews_url
    assert_response :success
  end

  test "should create skinews" do
    assert_difference('Skinew.count') do
      post skinews_url, params: { skinews: { body: @skinews.body, title: @skinews.title } }
    end

    assert_redirected_to skinews_url(Skinew.last)
  end

  test "should show skinews" do
    get skinews_url(@skinews)
    assert_response :success
  end

  test "should get edit" do
    get edit_skinews_url(@skinews)
    assert_response :success
  end

  test "should update skinews" do
    patch skinews_url(@skinews), params: { skinews: { body: @skinews.body, title: @skinews.title } }
    assert_redirected_to skinews_url(@skinews)
  end

  test "should destroy skinews" do
    assert_difference('Skinew.count', -1) do
      delete skinews_url(@skinews)
    end

    assert_redirected_to skinews_url
  end
end
