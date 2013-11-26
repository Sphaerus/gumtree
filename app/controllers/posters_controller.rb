class PostersController < ApplicationController
  before_action :set_poster, only: [:show, :destroy, :edit, :update]
  
  def index
    @posters = Poster.all
  end  
  
  def show
  end  
  
  def new
    session[:poster_params] ||= {}
    @poster = Poster.new(session[:poster_params])
    @poster.current_step = session[:poster_step]
  end
  
  def create
    session[:poster_params].deep_merge!(poster_params) if poster_params
    @poster = Poster.new(session[:poster_params])
    @poster.current_step = session[:poster_step]
    if params[:back_button]
      @poster.previous_step
    elsif @poster.last_step?
      initialize_poster_cleaner
      clean_of_wrong_category_fields
      @cleaner.delete_empty_fields
      @poster.save!  
    else  
      @poster.next_step
      initialize_poster_builder
      initialize_poster_cleaner
      clean_of_wrong_category_fields
    end
    session[:poster_step] = @poster.current_step
    if @poster.new_record?
      render "new"
    else
      session[:poster_step] = session[:poster_params] = nil
      flash[:notice] = "Poster successfully created!"
      redirect_to @poster
    end        
  end
  
  def edit
    initialize_poster_builder
  end  
  
  def update
    initialize_poster_cleaner
    @cleaner.assign_attributes_and_delete_empty_fields(poster_params)
    
    respond_to do |format|
      if @cleaner.save!
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
    params.require(:poster).permit(:content, :title, :category_id, :range_id, :range_type,
     collection_fields_attributes: [:element, :field_id, :collection_id, :id],
      string_fields_attributes: [:detail, :field_id, :id],
       float_fields_attributes: [:float_number, :field_id, :id],
        integer_fields_attributes: [:integer_number, :field_id, :id],
         text_fields_attributes: [:description, :field_id, :id],
          date_fields_attributes: [:date, :field_id, :id])
  end  
  
  def set_poster
    @poster = Poster.find(params[:id])
  end  
  
  def initialize_poster_cleaner
    @cleaner = PosterCleaner.new(@poster)
  end  
  
  def initialize_poster_builder
    PosterBuilder.new(@poster)
  end
  
  def clean_of_wrong_category_fields
    @cleaner.clean_of_wrong_category_fields
  end  
end  