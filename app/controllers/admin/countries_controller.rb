class Admin::CountriesController < AdminController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  before_action :set_countries_breadcrumbs, except: [:create, :update, :destroy]
  before_action :set_country_breadcrumbs, except: [:new, :index, :create, :update, :destroy]
  
  def index
    @countries = Country.all
  end
  
  def show
  end  
  
  def edit
    add_breadcrumb "Edit"
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
    add_breadcrumb "New"
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
    redirect_to [:admin, :countries]
  end
  
  private
  
  def country_params
    params.require(:country).permit(:name)
  end
  
  def set_country
    @country = Country.find(params[:id])
  end
  
  def set_countries_breadcrumbs
    add_breadcrumb "Countries", admin_countries_path
  end
  
  def set_country_breadcrumbs
    add_breadcrumb @country.name
  end
end