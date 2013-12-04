class Admin::CountriesController < AdminController
  before_action :set_country, only: [:show, :edit, :update]
  
  def index
    @countries = Country.all
  end
  
  def show
    @country = Country.find(params[:id])
  end  
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @country.assign_attributes(country_params)
        format.html { redirect_to [:admin, @country]}
      else  
        format.html { render action: "edit"}
      end
    end    
  end
  
  def new
    
  end
  
  private
  
  def country_params
    params.require(:country).permit(:name)
  end
  
  def set_country
    @country = Country.find(params[:id])
  end
end