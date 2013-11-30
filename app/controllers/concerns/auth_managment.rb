# -*- encoding : utf-8 -*-
module Concerns
  module AuthManagment
    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session[:user_id] = nil
    end

    def signed_in?
      !current_user.guest?
    end

    def authenticate_user!
      redirect_to welcome_path unless signed_in?
    end

    def authenticate_admin!
      redirect_to new_session_path if !signed_in? && !current_user.admin?
    end

    def current_user
      @_current_user ||= User.where(id: session[:user_id]).first || Guest.new
    end

    # def decorated_user
    #   @_decorated_user ||= current_user.try :decorate
    # end

    # def required_basic_auth!
    #   authenticate_or_request_with_http_basic do |user, password|
    #     user == configus.basic_auth.username && password == configus.basic_auth.password
    #   end
    # end
  end
end
