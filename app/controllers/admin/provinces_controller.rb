class Admin::ProvincesController < AdminController
  before_action :set_country
  before_action :set_province, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs, except: [:create, :update, :destroy]
  before_action :add_province_breadcrumb, only: [:show, :edit]
  
  def new
    @province = @country.provinces.build
    add_breadcrumb "New"
  end
  
  def create
    @province = @country.provinces.build(province_params)
    
    respond_to do |format|
      if @province.save!
        format.html { redirect_to [:admin, @country, @province]}
      else
        format.html { render action: "new" }
      end
    end      
  end
  
  def show
  end
  
  def edit
    add_breadcrumb "Edit"
  end
  
  def update
    respond_to do |format|
      if @province.update_attributes(province_params)
        format.html { redirect_to [:admin, @country, @province] }
      else
        format.html { render action: "edit"} 
      end
    end     
  end
  
  def destroy
    @province.destroy
    redirect_to [:admin, @country]
  end
  
  private
  
  def set_country
    @country = Country.find(params[:country_id])
  end
  
  def set_province
    @province = Province.find(params[:id])
  end
  
  def province_params
    params.require(:province).permit(:name, :country_id)
  end
  
  def set_breadcrumbs
    add_breadcrumb "Countries", [:admin, :countries]
    add_breadcrumb @country.name, [:admin, @country]
    add_breadcrumb "Provinces"
  end
  
  def add_province_breadcrumb
    add_breadcrumb @province.name
  end
end