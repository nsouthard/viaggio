class User < ApplicationRecord
  has_secure_password

  has_many :availabilities
  has_many :budgets
  has_many :location_preferences
  has_many :user_answers
  has_many :locations, through: :location_preferences

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_attachment :image, :presence => true,
    :content_type => { content_type: ["image/jpg", "image/png", "image/jpeg"]  }
 



end
