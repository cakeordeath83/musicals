class ShowsController < ApplicationController
  
  before_action :find_show, only:[:edit, :update, :show, :destroy]
  before_action :require_visitor
  
  def index
    @shows = Show.all
    @performances = Performance.all
  end
  
  def new
    @show = Show.new
  end
  
  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:success]="Show was saved"
      redirect_to shows_path
    else
      flash[:error]="Show was not saved"
      render :new
    end
  end
  
  def show
    @performances = Performance.all
  end
  
  def edit
    
  end
  
  def update
    if @show.update(show_params)
      flash[:success]="Show was updated"
      redirect_to show_path
    else
      flash[:error]="Show was not updated, please try again"
      render :edit
    end
  end
  
  def destroy
   
    if @show.destroy
    redirect_to shows_path
    else
      flash[:error]="Show wasn't deleted. Is is still associated with a performance? Please delete the performance first"
      redirect_to shows_path
    end
  end
  
 
  

private
    
  def find_show
    @show = Show.find(params[:id])
  end
  
  def show_params
    params.require(:show).permit(:name, :picture)
  end
    
  
end
