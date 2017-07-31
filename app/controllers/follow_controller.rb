class FollowController < ApplicationController
    def follow
        @follow = Follow.create(follower: current_user.id, followed: params[:followed]) 
        if @follow.save 
          redirect_to myusers_path
        end
    end
    
    def unfollow
        @unfollow = Follow.where(:follower => current_user.id).where(:followed => params[:followed]).first
      
        @unfollow.destroy
                  redirect_to myusers_path
    end

end
