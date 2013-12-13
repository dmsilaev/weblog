class Web::Admin::HostsController < ApplicationController
  def index
    @search_params = params[:q] || {}
    @query = { s: 'created_at desc' }.merge(params[:q] || {})
    @search = Host.ransack(@query)

    @hosts = @search.result.page(params[:page]).load
  end

  def update
  end
end
