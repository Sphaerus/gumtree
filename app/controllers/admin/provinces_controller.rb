class Admin::ProvincesController < AdminController
  before_action :set_country, only: [:index, :new, :create, :update, :show, :edit]
  before_action :set_province, only: [:show, :edit, :update, :destroy]
  
  def index
    @provinces = @country.provinces
  end
  
  def new
    @province = @country.provinces.build
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
    redirect_to [:admin, @country, :provinces]
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
  
end