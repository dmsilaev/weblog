class ApplicationController < ActionController::Base
  include Concerns::AuthManagment
  include Concerns::FlashHelper

  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user
end
