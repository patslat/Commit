module SessionsHelper
  def current_user
    User.where(session_token: session[:session_token]).first
  end

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logout_current_user!
    current_user.reset_session_token!
  end

  def require_current_user!
    redirect_to welcome_url if current_user.nil?
  end

  def require_no_current_user!
    redirect_to root_url unless current_user.nil?
  end
end
