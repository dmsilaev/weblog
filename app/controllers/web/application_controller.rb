# -*- encoding : utf-8 -*-
class Web::ApplicationController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
