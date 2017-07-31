class ProfileController < ApplicationController
    def profile
        @user = User.find(params[:id])
            @tweet = Tweet.new
            @tweets = Tweet.where("user_id = '#{@user.id}'").order('created_at DESC')
    end
end
