class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @current_user = User.find(session[:user_id]) if session[:user_id]
    gon.user_id = @user.id
    gon.current_user_id = @current_user.id
  end

  def follow
    Following.create( user: User.find(params[:id]), follower: User.find(session[:user_id]))
    render :nothing => true
  end

  def unfollow
    Following.where(user: User.find(params[:id]), follower: User.find(session[:user_id])).first.delete
    render :nothing => true
  end

  def edit
  end
end
