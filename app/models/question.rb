class Question < ApplicationRecord
  belongs_to :user

  validates :question, presence: true, length: { maximum: 200 }
  validates :correct, presence: true, length: { maximum: 5000 }
  validates :proficiency, presence: true, numericality: {greater_than: 0,less_than: 4}
end
