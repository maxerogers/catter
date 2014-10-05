class StaticPagesController < ApplicationController
  def login
    puts "login"
  end

  def signup
  end

  def signup_user
    puts params.inspect
    @user = User.create email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]
    puts @user
    if @user
      session[:user_id] = @user.id
      redirect_to :profile
    else
    #redirect_to action: 'signup', method: 'get', controller: 'static_pages', data: 'data'
      flash[:error] = "Error"
      redirect_to :signup
    end
  end

  def login_user
    puts params.inspect
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to :profile
    else
      redirect_to :welcome
    end
  end

  def profile
    redirect_to :welcome unless current_user
  end

  def welcome
  end
end
