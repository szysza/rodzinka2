require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get invitations" do
    get :invitations
    assert_response :success
  end

end
