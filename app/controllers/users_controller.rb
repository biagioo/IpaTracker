class UsersController < ApplicationController
    def new 
    end

    def create
        @user = User.create(user_params)
        if @user.valid? 
            flash[:notice] = "User creation was Successful!"
            #set_session
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def edit
        @user = User.find_by(id: params[:id])
    end
    
    def update
    end

    private

    def user_params
        params.permit(:username, :password, :email, :bio)
    end 
end
