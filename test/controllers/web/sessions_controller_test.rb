# -*- encoding : utf-8 -*-
require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login width email" do
    attrs = { email_or_login: @user.email, password: @user.password }

    post :create, session: attrs
    assert_response :redirect

    assert { signed_in? }
  end

  test "should login width login" do
    attrs = { email_or_login: @user.login, password: @user.password }

    post :create, session: attrs
    assert_response :redirect

    assert { signed_in? }
  end

  test "should no login" do
    attrs = { email_or_login: 'badlogin', password: @user.password }

    post :create, session: attrs
    assert_response :success
  end

  test "should logout" do
    sign_in @user

    delete :destroy
    assert_response :redirect

    assert { !signed_in? }
  end

end
