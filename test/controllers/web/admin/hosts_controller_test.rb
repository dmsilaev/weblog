require 'test_helper'

class Web::Admin::HostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
end
