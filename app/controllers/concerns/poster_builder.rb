class PosterBuilder
    
  def initialize(poster)
    @poster = poster
    build_fields_based_on_category unless @poster.category.nil?
  end
  
  private
  
  def build_fields_based_on_category
    @poster.category.fields.each do |field|
      unless list_all_field_ids.include?(field.id)
        @custom_field = @poster.send("#{field.kind}_fields").build
        @custom_field.source = field
      end
    end    
  end 
  
  def list_all_field_ids
    @poster.list_fields.map(&:field_id) 
  end
end