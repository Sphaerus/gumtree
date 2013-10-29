class CategoryForm
  
  attr_accessor :model
  
  def initialize(model, params = {})
    @model = model
    @model.assign_attributes(params)
    build_subcategories
  end  
  
  def save
    delete_empty_subcategories
    @model.save
  end  
  
  def update_attributes(params={})
    @model.update_attributes(params)
    delete_empty_subcategories
  end
    
  private
  
  def build_subcategories
    (8 - @model.subcategories.count).times { @model.subcategories.build}
  end
  
  def delete_empty_subcategories
    @model.subcategories.each { |subcategory| subcategory.delete if subcategory.name.blank? }
  end  
  
end  