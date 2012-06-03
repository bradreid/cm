class PingsController < ApplicationController
  
  def show
    TwitterFeed.send_tweets
    render :text => 'ping'
  end 
end