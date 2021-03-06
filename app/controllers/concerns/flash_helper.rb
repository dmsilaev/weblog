# -*- encoding : utf-8 -*-
module Concerns
  module FlashHelper
    def f(key, options = {})
      scope = [:flash]
      scope << params[:controller].split('/')
      scope << params[:action]

      msg = I18n.t(key, scope: scope)
      if options[:now]
        flash.now[key] = msg
      else
        flash[key] = msg
      end
    end
  end
end
