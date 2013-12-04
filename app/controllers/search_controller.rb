class SearchController < ApplicationController
  
  def index
    @result = ResultBuilder.new(params[:query]).result
    
    respond_to do |format|
      format.html
    end  
  end
  
end