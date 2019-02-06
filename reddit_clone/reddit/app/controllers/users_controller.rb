
class UsersController < ApplicationController

    def new 
        render :new
    end

    def index 
        @users = User.all
    end

    def create 
        @user = User.new(user_params)

        if @user.save!
            login(@user)
            redirect_to subs_url
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash.now[:error] = @user.full_messages
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy 

    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
