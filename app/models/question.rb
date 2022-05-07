class Question < ApplicationRecord
  belongs_to :user

  validates :correct, length: { maximum: 50 }
end
