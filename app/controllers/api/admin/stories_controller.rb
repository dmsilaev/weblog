class Api::Admin::StoriesController < Api::Admin::ApplicationController
  def update
    story = Story.find(params[:id])
    story.fire_state_event(params[:state_event])
    render head: :ok, location: nil , json: story
  end
end
