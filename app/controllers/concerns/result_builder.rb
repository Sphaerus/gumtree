class ResultBuilder
  
  attr_accessor :result
  
  def initialize(params = {})
    @category = Category.find(params[:category_id]) unless params[:category_id].blank?
    @result = Poster.by_category(@category)
  end
  
end