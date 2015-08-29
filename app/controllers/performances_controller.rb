class PerformancesController < ApplicationController
  
  before_action :find_performance, only:[:edit, :show, :update, :destroy]
  before_action :require_visitor, only:[:index, :show]
  
  def index
    @performances = Performance.all.sort_by{|p| p.date}.reverse
  end
  
  def perfchange
    @performances = Performance.all
  end
  
  def new
    @theatre_options = Theatre.all.sort_by{|t| t.name}.map{|t| [t.name, t.id]}
    @show_options = Show.all.sort_by{|s| s.name}.map{|s| [s.name, s.id]}
    @performance = Performance.new
    @theatres = Theatre.all
  end

 
  
  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      flash[:success]="Performance was saved"
      redirect_to performances_path
    else
      flash[:error]="Performance was not saved"
      redirect_to new_performance_path
    end
  end
  
  def show
  end
  
  def edit
    @theatre_options = Theatre.all.sort_by{|t| t.name}.map{|t| [t.name, t.id]}
    @show_options = Show.all.sort_by{|s| s.name}.map{|s| [s.name, s.id]}
  end
  
  def update
    if @performance.update(performance_params)
      flash[:success]="Performance was updated"
      redirect_to performances_path
    else
      flash[:error]="Performance was not updated"
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
