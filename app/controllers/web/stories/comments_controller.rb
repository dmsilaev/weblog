# -*- encoding : utf-8 -*-
class Web::Stories::CommentsController < Web::Stories::ApplicationController
  def create
    @comment = Story::CommentNewType.new(params[:story_comment])
    @comment.story = resource_story
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.js
    end
  end
end
