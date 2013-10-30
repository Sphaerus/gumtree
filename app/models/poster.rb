class Poster < ActiveRecord::Base
  belongs_to :user
  belongs_to :range, polymorphic: true
  belongs_to :kind, polymorphic: true
  
  validates :description, presence: true
  validates :kind_id, presence: true
end
