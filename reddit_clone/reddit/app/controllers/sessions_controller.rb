class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.new(user_params)
        if @user 
            login(@user)
            redirect_to subs_url
        else
            flash.now[:errors] = ["credentials incorrect"]
            render :new
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
