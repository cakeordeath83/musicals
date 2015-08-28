class TheatresController < ApplicationController
  
  before_action :find_theatre, only:[:show, :edit, :update, :destroy]
  
    def index
      @theatres = Theatre.all
      @performances = Performance.all
    end
  
    def new
      @theatre = Theatre.new
    end
  
    def create
      @theatre = Theatre.new(theatre_params)
      if @theatre.save
        flash[:success]="Theatre was saved"
        redirect_to theatres_path
      else
        flash[:error]="Theatre was not saved"
        render :new
      end
    end
    
    def show
      @performances = Performance.all
    end
    
    def edit
    end
    
    def update
      if @theatre.update(theatre_params)
        flash[:success]="Theatre was updated"
        redirect_to theatre_path
      else
        flash[:error]="Theatre was not updated, please try again"
        render :edit
      end
    end
    
      def destroy
        @theatre.destroy
        redirect_to theatres_path
      end
 private
    
    def find_theatre
      @theatre = Theatre.find(params[:id])
    end
  
    def theatre_params
      params.require(:theatre).permit(:name, :address, :address2, :city, :postcode, :picture)
    end
end


