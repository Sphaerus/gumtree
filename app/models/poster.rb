class Poster < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
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
  
  def list_fields
    self.text_fields +
    self.string_fields +
    self.integer_fields +
    self.date_fields +
    self.float_fields +
    self.collection_fields
  end  
end
