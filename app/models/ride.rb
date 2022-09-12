class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanics
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
end