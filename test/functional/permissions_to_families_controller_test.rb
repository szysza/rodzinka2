require 'test_helper'

class PermissionsToFamiliesControllerTest < ActionController::TestCase
=begin
  setup do
    @permissions_to_family = permissions_to_families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permissions_to_families)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create permissions_to_family" do
    assert_difference('PermissionsToFamily.count') do
      post :create, permissions_to_family: {  }
    end

    assert_redirected_to permissions_to_family_path(assigns(:permissions_to_family))
  end

  test "should show permissions_to_family" do
    get :show, id: @permissions_to_family
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @permissions_to_family
    assert_response :success
  end

  test "should update permissions_to_family" do
    put :update, id: @permissions_to_family, permissions_to_family: {  }
    assert_redirected_to permissions_to_family_path(assigns(:permissions_to_family))
  end

  test "should destroy permissions_to_family" do
    assert_difference('PermissionsToFamily.count', -1) do
      delete :destroy, id: @permissions_to_family
    end

    assert_redirected_to permissions_to_families_path
  end
=end
end
