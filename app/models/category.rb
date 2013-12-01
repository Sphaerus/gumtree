class Category < ActiveRecord::Base
  has_many :posters
  has_many :fields, foreign_key: :category_id, dependent: :destroy
  has_many :subcategories, class_name: "Category", foreign_key: "category_id", dependent: :destroy 
  belongs_to :parent_category, class_name: "Category"
  
  scope :without_parent, -> { where(category_id: nil)}
end
