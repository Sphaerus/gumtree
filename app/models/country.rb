class Country < ActiveRecord::Base
  has_many :posters, as: :range
  has_many :provinces
  has_many :towns, through: :provinces
end
