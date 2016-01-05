class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_visitor
  
  def current_visitor
    current_visitor ||= Visitor.find(session[:visitor_id]) if session[:visitor_id]
  end
  
  
  def require_visitor
    redirect_to login_path unless current_visitor
  end
  
end
