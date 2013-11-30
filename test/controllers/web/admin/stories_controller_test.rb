# -*- encoding : utf-8 -*-
require 'test_helper'

class Web::Admin::StoriesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.add_role :admin
    sign_in(@user)
    @story = create :story, user_id: @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  # test "should get show" do
  #   get :show, id: @story.id
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @story.id
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
