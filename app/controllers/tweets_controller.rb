class TweetsController < ApplicationController
  before_filter :set_tweet, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :js

  def index
    @user = User.find params[:user].first rescue nil
    @tweets = Tweet.all
    respond_with(@tweets)
  end

  def show
    respond_with(@tweet)
  end

  def new
    @tweet = Tweet.new
    respond_with(@tweet)
  end

  def edit
  end

  def create
    @tweet = Tweet.new(params[:tweet])
    @tweet.save
    respond_with(@tweet)
  end

  def update
    @tweet.update_attributes(params[:tweet])
    respond_with(@tweet)
  end

  def destroy
    @tweet.destroy
    respond_with(@tweet)
  end
  

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
