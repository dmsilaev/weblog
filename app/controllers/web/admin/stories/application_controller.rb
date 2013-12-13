# -*- encoding : utf-8 -*-
class Web::Admin::Stories::ApplicationController < Web::Admin::ApplicationController
  def resource_story
    Story.find(params[:story_id])
  end
end
