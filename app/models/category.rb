class Category < ActiveRecord::Base
  has_many :posters
  has_many :fields, foreign_key: :category_id, dependent: :destroy
  has_many :subcategories, class_name: "Category", foreign_key: "category_id", dependent: :destroy 
  belongs_to :parent_category, class_name: "Category"
  
  scope :without_parent, -> { where(category_id: nil)}
  
  def subcategories_with_children
    if self.subcategories.empty?
      self.id
    else
      category_ids = self.subcategories.map do |subcategory|
        subcategory.subcategories_with_children
      end
      category_ids.flatten
    end    
  end  
  
  def self.all_childless_categories
    childless_categories = Category.without_parent.map do |category|
      category.subcategories_with_children
    end
    self.where("id IN (?)", childless_categories.flatten)
  end
end
