class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true

  has_many :links_se, class_name: "Link", foreign_key: "junior_id"
  has_many :links_ju, class_name: "Link", foreign_key: "senior_id"
  has_many :seniors, through: :links_se, source: :senior
  has_many :juniors, through: :links_ju, source: :junior

  

end
