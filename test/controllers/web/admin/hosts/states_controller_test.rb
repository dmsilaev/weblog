require 'test_helper'

class Web::Admin::Hosts::StatesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.add_role :admin
    sign_in(@user)
    @host = create :host
  end

  test "should update host" do
    assert !@host.published?
    put :update, host_id: @host.id, state_event: :publish, format: :js
    assert_response :success
    @host.reload
    assert { @host.published? }
  end
end
