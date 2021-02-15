class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_name(params[:name])
        if user != nil
            session[:current_user_id] = user.id
            session[:current_user_name] = user.name
            flash[:success] = "User logged in"
            redirect_to user_path(user)
        else
            render :new
        end
    end

    def destroy
        session[:current_user_id] = nil
        session[:current_user_name] = nil
        flash[:success] = "Logged out"
        redirect_to new_sessions_path
    end
end
