class Web::WelcomeController < Web::ApplicationController
  def index
    @stories = params[:tag].present? ? Story.tagged_with(params[:tag]) : Story
    @query = { s: 'created_at desc', state_eq: 'published' }
    @search = @stories.ransack(@query)
    @stories = @search.result.page(params[:page]).load
  end
end
