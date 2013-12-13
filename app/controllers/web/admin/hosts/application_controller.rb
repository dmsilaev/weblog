# -*- encoding : utf-8 -*-
class Web::Admin::Hosts::ApplicationController < Web::Admin::ApplicationController
  def resource_host
    Host.find(params[:host_id])
  end
end
