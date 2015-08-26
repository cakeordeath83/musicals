class PerformancesController < ApplicationController
  
  before_action :find_performance, only:[:edit, :show, :update, :destroy]
  
  def index
    @performances = Performance.all
  end
  
  def new
    @theatre_options = Theatre.all.map{|t| [t.name, t.id]}
    @show_options = Show.all.map{|s| [s.name, s.id]}
    @performance = Performance.new
  end

  
  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      redirect_to performance_path(@performance)
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
    @theatre_options = Theatre.all.map{|t| [t.name, t.id]}
    @show_options = Show.all.map{|s| [s.name, s.id]}
  end
  
  def update
    if @performance.update(performance_params)
      redirect_to performances_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @performance.destroy
    redirect_to performances_path
  end
  
  private
  
  def find_performance
    @performance = Performance.find(params[:id])
  end
  
  def performance_params
    params.require(:performance).permit(:date, :show_id, :theatre_id)
  end
  
end
