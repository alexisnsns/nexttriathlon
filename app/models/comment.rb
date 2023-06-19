class Comment < ApplicationRecord
  belongs_to :race
  belongs_to :user

  validates :rating, numericality: { less_than_or_equal_to: 5, only_integer: true }
  validates_presence_of :date, :body, :positive, :negative, :rating
end
