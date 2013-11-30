require 'test_helper'

class Web::Admin::WelcomeControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.add_role :admin
    sign_in(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should not get index" do
    sign_out
    get :index
    assert_response :redirect
  end
end
