class Web::SessionsController < Web::ApplicationController
  def new
    if signed_in?
      f(:notice)
      redirect_to root_path
    else
      @session = UserSignInType.new
    end
  end

  def create
    @session = UserSignInType.new(params[:session])
    if @session.valid?
      user = @session.user
      sign_in(user)
      f(:success)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    f(:success)
    redirect_to root_path
  end

end
