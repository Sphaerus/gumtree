class FieldsController < ApplicationController
  before_action :set_category, only: [:create, :destroy]
  before_action :set_field, only: [:destroy]
  
  def create    
    @field = @category.fields.build(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to @category}
      else
        format.html { redirect_to @category}
      end  
    end    
  end     
  
  def destroy
    @field.destroy
    redirect_to @category
  end  
  
  private
  
  def field_params
    params.require(:field).permit(:kind, :description, :category_id)
  end
  
  def set_category
    @category = Category.find(params[:category_id])
  end  
  
  def set_field
    @field = Field.find(params[:id])
  end  
end  