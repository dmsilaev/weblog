require 'test_helper'

class Web::Stories::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.add_role :admin
    sign_in(@user)
    @story = create :story
  end

  test "should create comment" do
    attrs = FactoryGirl.attributes_for :story_comment
    post :create, story_comment: attrs, story_id: @story.id, format: :js
    comment = Story::Comment.find_by_body(attrs[:body])
    assert comment
    assert_response :success
  end
end
