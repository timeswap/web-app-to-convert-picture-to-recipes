helpers do

  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
    # @current_user ||= User.find(session[:id]) if session[:id]
  end

  def login
    session[:user_id] = @user.id
  end

  def logout
    # generally should not use .destroy
    # session.destroy
    session[:id] = nil
  end

  def logged_in?
    # current_user ? true : false
    !!current_user
  end

end
