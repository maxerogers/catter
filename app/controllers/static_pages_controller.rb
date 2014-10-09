class StaticPagesController < ApplicationController
  def signup_user
    puts params.inspect
    if params[:email] == "" || params[:password] == "" || params[:password_confirmation] == ""
      return redirect_to :signup, :flash => { :feedback_error => "has-error" }
    end
    unless User.where(email: params[:email]).empty?
      return redirect_to :signup, :flash => { :feedback_error => "has-error", error_type: "email" }
    end
    @user = User.create email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]
    if @user
      session[:user_id] = @user.id
      redirect_to action: "edit", method: "get", controller: "user", id: @user.id
    else
      #redirect_to action: 'signup', method: 'get', controller: 'static_pages', data: 'data'
      #flash[:error] = "Error"
      redirect_to :signup, :flash => { :feedback_error => "has-error" }
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
    puts params.inspect
    @current_user = User.find(session[:user_id])
    gon.user_id = session[:user_id]
    redirect_to :welcome unless current_user
  end

  def profile_edit
    @current_user = User.find(session[:user_id])
    @current_user.avatar = params[:file]
    @current_user.name = params[:name]
    @current_user.save!
    redirect_to :profile
  end

  def welcome
  end
end
