class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]
  
  def index
    @categories = Category.all
  end  
  
  def show
  end  
  
  def new
    @category = Category.new    
  end
  
  def create
    @category = Category.new(category_params)
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category }
      else
        format.html { render action: "new" }
      end 
    end     
  end
  
  def edit
  end
  
  def update    
    respond_to do |format|
      if @category.update_attributes(category_params)
        format.html { redirect_to @category }
      else
        format.html { render new }
      end 
    end 
  end      
  
  def destroy
    @category.destroy
    redirect_to categories_path
  end      
  
  private
  
  def category_params
    params.require(:category).permit(:name, :category_id)
  end  
  
  def set_category
    @category = Category.find(params[:id])
  end  
end  