class Message < ApplicationRecord
  belongs_to :link

  validates :message, presence: true, length: { maximum: 1000 }
  validates :source, presence: true
end
