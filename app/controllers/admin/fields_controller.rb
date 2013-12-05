class Admin::FieldsController < AdminController
  before_action :set_category, only: [:index, :new, :create, :destroy]
  before_action :set_field, only: [:destroy]
  
  def index
    @fields = @category.fields
  end
  
  def new
    @field = @category.fields.build
  end
  
  def create    
    @field = @category.fields.build(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to admin_category_fields_path(@category)}
      else
        format.html { render action: "new"}
      end  
    end    
  end     
  
  def destroy
    @field.destroy
    redirect_to [:admin, @category, :fields]
  end  
  
  private
  
  def field_params
    params.require(:field).permit(:kind, :description, :category_id, :collection_id)
  end
  
  def set_category
    @category = Category.find(params[:category_id])
  end  
  
  def set_field
    @field = Field.find(params[:id])
  end  
end  