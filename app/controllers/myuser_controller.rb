class MyuserController < ApplicationController
    def userList
        @users = User.all
    end
end
