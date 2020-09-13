class Link < ApplicationRecord
  belongs_to :junior, class_name: "User"
  belongs_to :senior, class_name: "User"

  validates :junior, presence: true
  validates :senior, presence: true
  validates :uuid, uniqueness: true
end
