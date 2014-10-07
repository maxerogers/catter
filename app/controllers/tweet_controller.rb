class TweetController < ApplicationController
  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def retweet
    t = Tweet.find(params[:id])
    Tweet.create(user: User.find(params[:current_user_id]), message: "@#{User.find(params[:user_id]).name} -> #{t.message}")
    render json: {message: "success"}.to_json
  end
end
