class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  has_many :questions, through: :answer
end
