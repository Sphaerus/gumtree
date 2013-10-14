class PostersController < ApplicationController
  
  def index
    @posters = Poster.all
  end  
  
  def show
    @poster = Poster.find(params[:id])
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
end  