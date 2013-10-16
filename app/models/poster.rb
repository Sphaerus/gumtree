class Poster < ActiveRecord::Base
  belongs_to :user
  belongs_to :range, polymorphic: true
  
  validates :description, presence: true
  
end
