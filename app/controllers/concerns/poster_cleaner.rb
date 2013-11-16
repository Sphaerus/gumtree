class PosterCleaner
  attr_accessor :poster, :field
  
  def initialize(poster, params = {})
    @poster = poster
    @poster.assign_attributes(params)    
    clear_of_empty_fields
  end
  
  def save!
    @poster.save!
  end  
  
  private
  
  def clear_of_empty_fields
    @poster.list_fields.each do |field|
      check_if_empty_and_destroy(field)
    end
  end  
  
  def check_if_empty_and_destroy(field)
    @field = field
    
    case field
    when DateField
      if @field.date.nil?
        destroy_field
      end
    when StringField
      if @field.detail.blank?
        destroy_field
      end
    when FloatField
      if @field.float_number.nil?
        destroy_field
      end
    when IntegerField
      if @field.integer_number.nil?
        destroy_field
      end
    when TextField
      if @field.description.blank?
        destroy_field
      end
    end                    
  end
  
  def destroy_field
    @field.destroy
  end    
end  