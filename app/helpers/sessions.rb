helpers do

  def current_user
    # session[:user_id] ? User.find(session[:user_id]) : nil
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def login
    # session[:user_id] = @user.id
    session[:id] = @user.id
  end

  def logout
    # session.destroy
    session[:id] = nil
  end

  def logged_in?
    !!current_user
  end

end
