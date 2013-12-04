class Poster < ActiveRecord::Base
  attr_writer :current_step
  
  belongs_to :user
  belongs_to :category
  belongs_to :range, polymorphic: true
  has_many :text_fields
  has_many :string_fields
  has_many :integer_fields
  has_many :float_fields
  has_many :date_fields
  has_many :collection_fields
    
  accepts_nested_attributes_for :float_fields
  accepts_nested_attributes_for :integer_fields
  accepts_nested_attributes_for :text_fields
  accepts_nested_attributes_for :string_fields
  accepts_nested_attributes_for :date_fields
  accepts_nested_attributes_for :collection_fields
  
  validates :content, presence: true 
  validates :range_type, :range_id, presence: true
  validates :category_id, presence: true
  
  def self.by_category(category = nil)
    if category.nil?
      where("category_id IN (?)", Category.all_childless_categories)
    else  
      where("category_id IN (?)", category.subcategories_with_children)
    end  
  end
  
  def list_fields
    self.text_fields +
    self.string_fields +
    self.integer_fields +
    self.date_fields +
    self.float_fields +
    self.collection_fields
  end 
  
  def steps
    %w(location category fields)
  end 
  
  def current_step
    @current_step || steps.first
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end  
  
  def first_step?
    current_step == steps.first
  end  
  
  def last_step?
    current_step == steps.last
  end  
  
end
