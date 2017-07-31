class RetweetController < ApplicationController
    def retweet
        @retweet = Tweet.create(post: params[:post], user_id: current_user.id) 
        if @retweet.save 
          redirect_to tweets_path
        end
    end
end
