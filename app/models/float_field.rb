class FloatField < ActiveRecord::Base
  include LabelAssistant
  
  belongs_to :poster
  belongs_to :source, class_name: "Field", foreign_key: "field_id"
end
