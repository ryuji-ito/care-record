class Floor < ApplicationRecord
  belongs_to :user
  has_many :residents
  validates :name, presence: true, uniqueness: true
end
