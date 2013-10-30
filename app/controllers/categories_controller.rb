class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy]
  
  def index
    @categories = Category.all
  end  
  
  def show
  end  
  
  def new
    @category = Category.new    
    @category_form = CategoryForm.new(@category)
  end
  
  def create
    @category = Category.new
    @category_form = CategoryForm.new(@category, category_params)
    
    respond_to do |format|
      if @category_form.save
        format.html { redirect_to @category }
      else
        format.html { render action: "new" }
      end 
    end     
  end
  
  def edit
    @category = Category.find(params[:id])
    @category_form = CategoryForm.new(@category)
  end
  
  def update
    @category = Category.find(params[:id])
    @category_form = CategoryForm.new(@category)
    
    respond_to do |format|
      if @category_form.update_attributes(category_params)
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
    params.require(:category).permit(:name, subcategories_attributes: [:id, :name])
  end  
  
  def set_category
    @category = Category.find(params[:id])
  end  
end  