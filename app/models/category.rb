class Category < ActiveRecord::Base
  has_many :posters, as: :kind
  has_many :subcategories, dependent: :destroy
  accepts_nested_attributes_for :subcategories
  
  def self.with_subcategories
    choices = []
    self.all.each do |category|
      choices << category
      category.subcategories.each do |subcategory|
        choices << subcategory
      end  
    end  
    choices
  end  
end
