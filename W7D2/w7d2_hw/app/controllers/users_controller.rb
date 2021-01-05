class UsersController < ApplicationController
  before_action :require_no_user!

  # Topic 3: Action Mailer

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)

      # Topic 3: Action Mailer
      # 4. When a user signs up for your app, 
      # send them the welcome e-mail. 
      msg = UserMailer.welcome_email(@user)
      msg.deliver_now

      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  private
  
  def user_params
    params.require(:user).permit(:password, :username)
  end
end
