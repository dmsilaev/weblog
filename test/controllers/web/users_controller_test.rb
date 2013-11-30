require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    attrs = FactoryGirl.attributes_for(:user)
    post :create, user: attrs
    user = User.find_by_email(attrs[:email])
    assert_response :redirect
  end

  test "should redirect if sign_in user" do
    user = create :user
    sign_in(user)
    get :new
    assert_response :redirect
  end
end
