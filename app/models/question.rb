class Question < ApplicationRecord
  has_many :answers
  has_many :user_answers, through: :answers
end
