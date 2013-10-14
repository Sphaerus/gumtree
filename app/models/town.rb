class Town < ActiveRecord::Base
  belongs_to :state
  has_many :posters, as: :range
end
