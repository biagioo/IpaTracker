class UsersController < ApplicationController
    before_action :logged_in?, :current_user, except: [:new, :create]
    def new 
    end

    def create
        @user = User.create(user_params)
        if @user.valid? 
            flash[:notice] = "User creation was Successful!"
            set_session
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end
    
    def update
    end

    private

    def user_params
        params.permit(:username, :password, :email, :bio)
    end 
end
