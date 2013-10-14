class Country < ActiveRecord::Base
  has_many :posters, as: :range
  has_many :states
  has_many :towns, through: :states
end
