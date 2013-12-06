# -*- encoding : utf-8 -*-
class Api::Admin::ApplicationController < Api::ApplicationController
  before_filter :authenticate_admin!

end
