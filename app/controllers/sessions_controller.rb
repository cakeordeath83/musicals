class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @visitor = Visitor.find_by_email(params[:session][:email])
     
    
    
    if @visitor && @visitor.authenticate(params[:session][:password])
      session[:visitor_id] = @visitor.id
      redirect_to performances_path
    else
      redirect_to shows_path
    end
  end
  
  def destroy
    session[:visitor_id] = nil
    redirect_to '/'
  end
  
end
