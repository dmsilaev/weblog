# -*- encoding : utf-8 -*-
require 'test_helper'

class Web::StoriesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.add_role :admin
    sign_in(@user)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect new if not sign_in" do
    sign_out
    get :new
    assert_response :redirect
  end

  test "should create story" do
    attrs = FactoryGirl.attributes_for(:story)
    post :create, story: attrs
    assert_response :redirect
  end

  test "should get show" do
    story = create :story, user_id: @user.id

    get :show, id: story.id
    assert_response :success
  end
end
