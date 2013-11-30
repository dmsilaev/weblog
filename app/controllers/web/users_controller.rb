class Web::UsersController < Web::ApplicationController
  def new
    if signed_in?
      f(:notice)
      redirect_to root_path
    else
      @user = UserSignUpType.new
    end
  end

  def create
    @user = UserSignUpType.new(params[:user])
    if @user.save
      f(:success)
      sign_in(@user)
      redirect_to root_path
    else
      render "new"
    end
  end
end
