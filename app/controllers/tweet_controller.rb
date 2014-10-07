class TweetController < ApplicationController
  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def new
    puts params.inspect
    if (params[:message] && params[:message] != "")
      Tweet.create message: params[:message], user: User.find(params[:user_id])
      return render json: {message: "success"}.to_json
    end
    render json: {message: "failure"}.to_json
  end

  def retweet
    t = Tweet.find(params[:id])
    Tweet.create(user: User.find(params[:current_user_id]), message: "@#{User.find(params[:user_id]).name} -> #{t.message}")
    render json: {message: "success"}.to_json
  end
end
