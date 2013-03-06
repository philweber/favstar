class TweetsController < ApplicationController

  require "rubygems"
  require "twitter"

  def post    
    id = params[:tweet_id]
    
    if !id.blank?
      redirect_to get_tweet_path(id)
    end    
  end

  def get
    id = params[:tweet_id]

    if !id.blank?
      if id.numeric? 
        Twitter.configure do |config|
          config.consumer_key = YOUR_APPS_CONSUMER_KEY
          config.consumer_secret =  YOUR_APPS_CONSUMER_SECRET
          config.oauth_token = YOUR_OAUTH_TOKEN
          config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
        end

        begin
          @tweet_text = Twitter.status(id).text
        rescue
          @error_msg = "Sorry, I couldn't find that tweet."
        end
      end
    end  
  end

end
