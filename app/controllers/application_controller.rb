class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :admin?

    def current_user
    @user = User.find_by(id: session[:user_id])
  end
  
  def set_session
    session[:user_id] = @user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    current_user.admin
  end

  def not_authorized
    redirect_to new_user_path unless logged_in?
  end
end
