class Poster < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :text_fields
  has_many :string_fields
  has_many :integer_fields
  has_many :float_fields
  has_many :date_fields
    
  accepts_nested_attributes_for :float_fields
  accepts_nested_attributes_for :integer_fields
  accepts_nested_attributes_for :text_fields
  accepts_nested_attributes_for :string_fields
  accepts_nested_attributes_for :date_fields
  
  validates :content, presence: true 
  
  def list_fields
    fields = []
    self.text_fields.each { |field| fields << field }
    self.string_fields.each { |field| fields << field }
    self.integer_fields.each { |field| fields << field }
    self.date_fields.each { |field| fields << field }
    self.float_fields.each { |field| fields << field }
    fields
  end  
end
