class Review < ApplicationRecord
  validates :star, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content, presence: true, length: { maximum: 500 }

  belongs_to :senior, class_name: "User"
  belongs_to :junior, class_name: "User"
end
