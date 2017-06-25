class Location < ApplicationRecord
  has_many :location_preferences
  has_many :matches
  has_many :user, through: :location_preferences
end
