class ShowsController < ApplicationController
  
  before_action :find_show, only:[:edit, :update, :show, :destroy]
  
  def index
    @shows = Show.all
  end
  
  def new
    @show = Show.new
  end
  
  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to shows_path
    else
      render :new
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if @show.update(show_params)
      redirect_to show_path
    else
      render :edit
    end
  end
  
  def destroy
    @show.destroy
    redirect_to shows_path
  end
  
  
  private
  
  def find_show
    @show = Show.find(params[:id])
  end
  
  def show_params
    params.require(:show).permit(:name)
  end
    
  
end
