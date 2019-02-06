class SubsController < ApplicationController

    # before_action :require_login
    
    def new 
    end

    def index
        @subs = Sub.all
    end

    def create 
        
    end

    def edit 
        @sub = Sub.new(params[:id)
    end

    def update

    end

    def show
        @sub = Sub.find(params[:id])
    end
    

    def sub_params 
        params.require(:sub).permit(:title, :description)
    end
end 
