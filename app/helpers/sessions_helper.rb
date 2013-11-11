module SessionsHelper
  def current_user
    User.where(session_token: session[:session_token]).first
  end

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logged_in?
    !!current_user
  end

  def logout_current_user!
    current_user.reset_session_token!
  end

  def require_current_user!
    redirect_to welcome_url unless logged_in?
  end

  def require_no_current_user!
    redirect_to root_url if logged_in?
  end
end
