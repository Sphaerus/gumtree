class Province < ActiveRecord::Base
  belongs_to :country
  has_many :posters, as: :range
  has_many :towns, dependent: :destroy
end
