class LocationPreference < ApplicationRecord
  belongs_to :user
  belongs_to :location, optional: true
end
