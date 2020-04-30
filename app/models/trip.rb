class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_coordinates
  has_many :observations, through: :trip_coordinates
end
