class Admin::CollectionsController < AdminController
  before_action :set_collection, only: [:edit, :update, :destroy, :show]
  before_action :set_collections_breadcrumb, except: [:update, :create, :destroy, :add_to_collection, :remove_from_collection]
  before_action :add_collection_breadcrumb, only: :edit
  
  def index
    @collections = Collection.all
  end  
  
  def show
    add_breadcrumb @collection.name
  end
  
  def new
    @collection = Collection.new
    add_breadcrumb "New"
  end
  
  def create
    @collection = Collection.new(collection_params)
    
    respond_to do |format|
      if @collection.save!
        format.html { redirect_to [:admin, @collection]}
      else
        format.html { render action: "new"}  
      end  
    end    
  end
  
  def edit
    add_breadcrumb "Edit"
  end
  
  def update    
    respond_to do |format|
      if @collection.update_attributes(collection_params)
        format.html { redirect_to [:admin, @collection] }
      else
        format.html { render new }
      end 
    end 
  end 
  
  def add_to_collection
    @collection = Collection.find(params[:collection_id])
    @element = params[:collection][:element]
    @collection.add_to_collection(@element)
    @collection.save!
    redirect_to [:admin, @collection]  
  end
  
  def remove_from_collection
    @collection = Collection.find(params[:collection_id])
    @collection.remove_from_collection(params[:index])
    @collection.save!
    redirect_to [:admin, @collection]
  end
  
  def destroy
    @collection.destroy
    redirect_to admin_collections_path
  end
  
  private
  
  def set_collection
    @collection = Collection.find(params[:id])
  end
  
  def collection_params
    params.require(:collection).permit(:name)
  end    
  
  def set_collections_breadcrumb
    add_breadcrumb "Collections", admin_collections_path
  end
  
  def add_collection_breadcrumb
    add_breadcrumb @collection.name
  end
end