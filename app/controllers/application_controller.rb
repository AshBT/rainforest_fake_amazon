class ApplicationController < ActionController::Base
  protect_from_forgery

  #the following allows you to use the current_user method anywhere in the controllers 
  #which inherit from ApplicationController
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  #this lets you use the current_user method anywhere in the views
  helper_method :current_user  

end