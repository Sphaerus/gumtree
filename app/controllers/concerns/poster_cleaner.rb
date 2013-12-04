class PosterCleaner
  
  def initialize(poster)
    @poster = poster
  end
  
  def assign_attributes_and_delete_empty_fields(params = {})
    @poster.assign_attributes(params)
    clean_of_empty_fields
  end
  
  def clean_of_wrong_category_fields
    @poster.list_fields.each do |field|
      destroy_if_wrong_category(field)
    end
  end  
  
  def delete_empty_fields
    clean_of_empty_fields
  end  
  
  def save!
    @poster.save!
  end  
  
  private
  
  def clean_of_empty_fields
    @poster.list_fields.each do |field|
      check_if_empty_and_destroy(field)
    end
  end  
  
  def check_if_empty_and_destroy(field)
    @field = field    
    
    case @field
    when DateField
      if @field.date.nil?
        @poster.date_fields.delete(@field)
      end
    when StringField
      if @field.detail.blank?
        @poster.string_fields.delete(@field)
      end
    when FloatField
      if @field.float_number.nil?
        @poster.float_fields.delete(@field)
      end
    when IntegerField
      if @field.integer_number.nil?
        @poster.integer_fields.delete(@field)
      end
    when TextField
      if @field.description.blank? 
        @poster.description_fields.delete(@field)
      end
    when CollectionField
      if @field.element.blank?       
        @poster.collection_fields.delete(@field)
      end    
    end                    
  end
  
  def destroy_if_wrong_category(field)
    @field = field
    
    case @field
    when DateField
      if field_from_wrong_category?
        @poster.date_fields.delete(@field)
      end
    when StringField
      if field_from_wrong_category?
        @poster.string_fields.delete(@field)
      end
    when FloatField
      if field_from_wrong_category?
        @poster.float_fields.delete(@field)
      end
    when IntegerField
      if field_from_wrong_category?
        @poster.integer_fields.delete(@field)
      end
    when TextField
      if field_from_wrong_category?
        @poster.description_fields.delete(@field)
      end
    when CollectionField
      if field_from_wrong_category?
        @poster.collection_fields.delete(@field)
      end    
    end 
  end  

  def field_from_wrong_category?
    @field.source.category != @poster.category    
  end
  
  def field_is_new_record?
    @field.new_record?
  end
end  