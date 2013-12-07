class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:show, :destroy, :edit, :update]
  before_action :set_categories_breadcrumbs, only: [:show, :edit]
  
  def index
    @categories = Category.without_parent
    add_breadcrumb "Categories"
  end  
  
  def show
    @subcategories = @category.subcategories
    
    respond_to do |format|
      format.html
      format.json { render json: @subcategories }
    end  
  end  
  
  def new
    @category = Category.new    
    add_breadcrumb "New"
  end
  
  def create
    @category = Category.new(category_params)
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to [:admin, @category] }
      else
        format.html { render action: "new" }
      end 
    end     
  end
  
  def edit
    add_breadcrumb "Edit"
  end
  
  def update    
    respond_to do |format|
      if @category.update_attributes(category_params)
        format.html { redirect_to [:admin, @category] }
      else
        format.html { render action: "edit" }
      end 
    end 
  end      
  
  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end      
  
  private
  
  def category_params
    params.require(:category).permit(:name, :category_id)
  end  
  
  def set_category
    @category = Category.find(params[:id])
  end  
  
  def set_categories_breadcrumbs
    add_breadcrumb "Categories", admin_categories_path
    add_breadcrumb @category.name
  end
end  