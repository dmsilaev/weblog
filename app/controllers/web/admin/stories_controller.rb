class Web::Admin::StoriesController < Web::Admin::ApplicationController
  def index
    @search_params = params[:q] || {}
    @query = { s: 'created_at desc' }.merge(params[:q] || {})
    @search = Story.ransack(@query)

    @stories = @search.result.page(params[:page]).load
  end

  # def show
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
end
