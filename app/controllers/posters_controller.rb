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
    PosterCreator.new(@poster)
  end  
  
  def update
    @cleaned_poster = PosterCleaner.new(@poster, poster_params)
    
    respond_to do |format|
      if @cleaned_poster.save!
        format.html { redirect_to @poster }
      else
        format.html { render action: "new" }
      end 
    end 
  end  
  
  def destroy
    @poster.destroy
    redirect_to posters_path
  end      
  
  private
  
  def poster_params
    params.require(:poster).permit(:content, :title, :category_id, collection_fields_attributes: [:element, :field_id, :collection_id, :id], string_fields_attributes: [:detail, :field_id, :id], float_fields_attributes: [:float_number, :field_id, :id], integer_fields_attributes: [:integer_number, :field_id, :id], text_fields_attributes: [:description, :field_id, :id], date_fields_attributes: [:date, :field_id, :id])
  end  
  
  def set_poster
    @poster = Poster.find(params[:id])
  end  
end  