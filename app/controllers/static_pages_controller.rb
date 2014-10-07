class StaticPagesController < ApplicationController
  def signup_user
    @user = User.create email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]
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
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to :profile
    else
      redirect_to :welcome, :flash => { :feedback_error => "has-error" }
    end
  end

  def signout
    session[:user_id] = nil
    @current_user = nil
    redirect_to :welcome
  end

  def signup
  end

  def profile
    gon.user_id = session[:user_id]
    redirect_to :welcome unless current_user
  end

  def profile_edit
    @current_user = User.find(session[:user_id])
    @current_user.avatar = params[:file]
    @current_user.save!
    redirect_to :profile
  end

  def welcome
  end
end
