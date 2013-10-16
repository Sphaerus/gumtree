class State < ApplicationController
  belongs_to :country
  has_many :posters, as: :range
  has_many :towns
end
