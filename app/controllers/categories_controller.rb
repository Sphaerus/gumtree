class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]
  before_action :set_parent_category, only: [:create_child]
  
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
  
  def create_child
    @child_category = @category.subcategories.build(category_params)
    
    respond_to do |format|
      if @child_category.save!
        format.html { redirect_to @child_category }
      else
        format.html { redirect_to @category }
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
        format.html { render action: "edit" }
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
  
  def set_parent_category
    @category = Category.find(params[:category_id])
  end
end  