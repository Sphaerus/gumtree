class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :posters, as: :kind
end
