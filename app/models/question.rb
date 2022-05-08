class Question < ApplicationRecord
  belongs_to :user

  validates :question, presence: true, length: { maximum: 50 }
  validates :correct, presence: true, length: { maximum: 500 }
  validates :proficiency, presence: true, numericality: {greater_than: 0,less_than: 6}
end
