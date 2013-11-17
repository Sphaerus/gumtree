class CollectionsController < ApplicationController
  before_action :set_collection, only: [:edit, :update, :destroy, :show]
  
  def index
    @collections = Collection.all
  end  
  
  def show
  end
  
  def new
    @collection = Collection.new
  end
  
  def create
    @collection = Collection.new(collection_params)
    
    respond_to do |format|
      if @collection.save!
        format.html { redirect_to @collection}
      else
        format.html { render action: "new"}  
      end  
    end    
  end
  
  def edit
  end
  
  def update    
    respond_to do |format|
      if @collection.update_attributes(collection_params)
        format.html { redirect_to @collection }
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
    redirect_to @collection  
  end
  
  def remove_from_collection
    @collection = Collection.find(params[:collection_id])
    @collection.remove_from_collection(params[:index])
    @collection.save!
    redirect_to @collection
  end
  
  def destroy
    @collection.destroy
    redirect_to collections_path
  end
  
  private
  
  def set_collection
    @collection = Collection.find(params[:id])
  end
  
  def collection_params
    params.require(:collection).permit(:name)
  end    
end