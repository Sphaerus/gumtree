class Country < ActiveRecord::Base
  has_many :posters, as: :range
  has_many :provinces, dependent: :destroy
  has_many :towns, through: :provinces
end
