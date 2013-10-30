class PostersController < ApplicationController
  before_action :set_poster, only: [:show, :destroy, :edit, :update]
  
  def index
    @posters = Poster.all
  end  
  
  def show
  end  
  
  def new
    @poster = Poster.new
  end
  
  def create
    @poster = Poster.new(poster_params)
    
    respond_to do |format|
      if @poster.save
        format.html { redirect_to @poster }
      else
        format.html { render action: "new" }
      end 
    end     
  end
  
  def edit
  end  
  
  def update
    
    respond_to do |format|
      if @poster.update_attributes(poster_params)
        format.html { redirect_to @poster }
      else
        format.html { render action: "new" }
      end 
    end 
  end  
  
  def destroy
    @poster.delete
    redirect_to posters_path
  end      
  
  private
  
  def poster_params
    params.require(:poster).permit(:description, :title, :kind_id, :kind_type)
  end  
  
  def set_poster
    @poster = Poster.find(params[:id])
  end  
end  