class Admin::ProvincesController < AdminController
  before_action :set_country, only: [:index]
  before_action :set_province, only: [:show, :edit, :update, :destroy]
  
  def index
    @provinces = @country.provinces
  end
  
  def new
    @province = Province.new
  end
  
  def create
    @province = Province.new(province_params)
    
    respond_to do |format|
      if @province.save!
        format.html { redirect_to @province}
      else
        format.html { render action: "new" }
      end
    end      
  end
  
  def show
  end
  
  def edit
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