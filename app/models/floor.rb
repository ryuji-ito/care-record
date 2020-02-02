class Floor < ApplicationRecord
  belongs_to :user
  has_many :floor_residents
  has_many :residents, through: :floor_residents
  validates :name, presence: true, uniqueness: true
end
