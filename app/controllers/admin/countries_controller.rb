class Admin::CountriesController < AdminController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  
  def index
    @countries = Country.all
  end
  
  def show
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
    @country = Country.new
  end
  
  def create
    @country = Country.new(country_params)
    
    respond_to do |format|
      if @country.save!
        format.html { redirect_to [:admin, @country]} 
      else
        format.html { render action: "new"}
      end  
    end   
  end
  
  def destroy
    @country.destroy
    redirect_to admin_countries_path
  end
  
  private
  
  def country_params
    params.require(:country).permit(:name)
  end
  
  def set_country
    @country = Country.find(params[:id])
  end
end