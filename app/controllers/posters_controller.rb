class PostersController < ApplicationController
  before_action :set_poster, only: [:show, :destroy]
  
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
        format.html { render new }
      end 
    end     
  end
  
  def destroy
    @poster.delete
    redirect_to posters_path
  end      
  
  private
  
  def poster_params
    params.require(:poster).permit(:description, :title)
  end  
  
  def set_poster
    @poster = Poster.find(params[:id])
  end  
end  