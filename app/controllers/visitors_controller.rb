class VisitorsController < ApplicationController
  
  def new
    @visitor = Visitor.new
  end
  
  def create
    @visitor = Visitor.new(visitor_params)
      if @visitor.save
        session[:visitor_id] = @visitor.id
        redirect_to performances_path
      else
        redirect_to signup_path
      end
  end
  
  private
  
  def visitor_params
    params.require(:visitor).permit(:email, :password)
  end
  
end
