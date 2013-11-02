class Poster < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  validates :description, presence: true
  validates :kind_id, presence: true
end
