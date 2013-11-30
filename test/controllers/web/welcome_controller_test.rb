# -*- encoding : utf-8 -*-
require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should get index with tag" do
    get :index, tag: 'ruby'
    assert_response :success
  end
end
