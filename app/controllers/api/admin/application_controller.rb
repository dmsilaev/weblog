class Api::Admin::ApplicationController < Api::ApplicationController
  before_filter :authenticate_admin!

  respond_to :json
end
