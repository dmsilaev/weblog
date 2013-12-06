# -*- encoding : utf-8 -*-
class Web::Stories::ApplicationController < Web::ApplicationController
  before_filter :authenticate_user!

  def resource_story
    Story.find(params[:story_id])
  end
end
