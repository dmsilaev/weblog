# -*- encoding : utf-8 -*-
class Web::Admin::ApplicationController < Web::ApplicationController
  before_filter :authenticate_admin!
end
