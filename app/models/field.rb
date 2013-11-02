class Field < ActiveRecord::Base
  FIELD_TYPES = %w(integer float date string text)
  
  validates :description, presence: true
  validates :kind, presence: true
  
  belongs_to :category
    
end
