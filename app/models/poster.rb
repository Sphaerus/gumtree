class Poster < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :description_fields
  
  validates :description, presence: true
end
