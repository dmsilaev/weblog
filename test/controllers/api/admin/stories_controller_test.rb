# -*- encoding : utf-8 -*-
require 'test_helper'

class Api::Admin::StoriesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.add_role :admin
    sign_in(@user)
    @story = create :story
  end

  test "should update story" do
    assert !@story.published?
    put :update, id: @story.id, state_event: :publish
    assert_response :success
    @story.reload
    assert { @story.published? }
  end
end
