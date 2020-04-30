class TripCoordinate < ApplicationRecord
  belongs_to :trip
  has_many :observations
end
