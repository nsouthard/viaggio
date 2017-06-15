class User < ApplicationRecord
  has_secure_password

  has_many :availabilities
  has_many :budgets
  has_many :location_preferences
  has_many :user_answers
  has_many :locations, through: :location_preferences
  
end
