class Web::Admin::Hosts::StatesController < Web::Admin::Hosts::ApplicationController
  def update
    @host = resource_host
    @host.fire_state_event(params[:state_event])
  end
end
