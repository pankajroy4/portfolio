require "test_helper"

class Admin::AboutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_abouts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_abouts_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_abouts_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_abouts_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_abouts_destroy_url
    assert_response :success
  end
end
