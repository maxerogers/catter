class TweetController < ApplicationController
  def create
  end

  def show
  end

  def edit
  end

  def delete
  end
  def info
    render json: {message: "test"}.to_json
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
  def test
    render :test
  end
  def delete
    Tweet.find(params[:id]).delete
    redirect_to :back
  end
end

#Tweet.where("message LIKE ?", "%#praisecatgod%") This will search tweets for hashtags
