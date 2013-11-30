# -*- encoding : utf-8 -*-
class Web::StoriesController < Web::ApplicationController
  authorize_resource

  def new
    @story = StoryNewType.new
  end

  def create
    @story = StoryNewType.new(params[:story])
    @story.user = current_user
    if @story.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end
end
