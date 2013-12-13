require 'test_helper'

class Web::Admin::Stories::StatesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.add_role :admin
    sign_in(@user)
    @story = create :story, user_id: @user.id
  end

  test "should update story" do
    assert !@story.published?
    put :update, story_id: @story.id, state_event: :publish, format: :js
    assert_response :success
    @story.reload
    assert { @story.published? }
  end
end
