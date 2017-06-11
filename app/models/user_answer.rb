class UserAnswer < ApplicationRecord
  belongs_to :user
  has_many: :questions, through: :user_answers
end
