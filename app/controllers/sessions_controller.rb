class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @visitor = Visitor.find_by_email(params[:session][:email])
     
    
    
    if @visitor && @visitor.authenticate(params[:session][:password])
      session[:visitor_id] = @visitor.id
      flash[:success]="Welcome #{@visitor.email}"
      redirect_to performances_path
    else
      
      flash[:error]="Name or password are incorrect, please try again"
        
      render :new
    end
  end
  
  def destroy
    session[:visitor_id] = nil
    redirect_to '/'
  end
  
end
