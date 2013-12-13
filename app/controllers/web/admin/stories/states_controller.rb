class Web::Admin::Stories::StatesController < Web::Admin::Stories::ApplicationController
  def update
    @story = resource_story
    @story.fire_state_event(params[:state_event])
  end
end
