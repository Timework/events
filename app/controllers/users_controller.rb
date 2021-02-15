class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to @user
            session[:current_user_id] = @user.id
            session[:current_user_name] = @user.name
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        @events = @user.events
        @attendeds = @user.attended_events.all
    end

    private
    def user_params
        params.require(:user).permit(:name)
    end
end
