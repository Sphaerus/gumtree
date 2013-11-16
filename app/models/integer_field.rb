class IntegerField < ActiveRecord::Base
  belongs_to :poster
  belongs_to :source, class_name: "Field", foreign_key: "field_id"
end
