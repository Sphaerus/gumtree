class Admin::TownsController < AdminController
  before_action :set_province
  before_action :set_country
  before_action :set_town, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def new
    @town = @province.towns.build
  end
  
  def create
    @town = @province.towns.build(town_params)
    
    respond_to do |format|
      if @town.save!
        format.html { redirect_to [:admin, @country, @province, @town] }
      else
        format.html { render action: "new" }
      end
    end      
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @town.update_attributes!(town_params)
        format.html { redirect_to [:admin, @country, @province, @town] }
      else
        format.html { render action: "edit"}
      end
    end    
  end
  
  def destroy
    @town.destroy
    redirect_to [:admin, @country, @province]
  end
  
  private
  
  def set_town
    @town = Town.find(params[:id])
  end
  
  def set_province
    @province = Province.find(params[:province_id])
  end
  
  def set_country
    @country = Country.find(params[:country_id])
  end
  
  def town_params
    params.require(:town).permit(:province_id, :name)
  end
end