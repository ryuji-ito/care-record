class Resident < ApplicationRecord
  belongs_to :floor, optional: true
  has_many :records
  belongs_to :user
  has_many :floor_residents
  has_many :floors, through: :floor_residents
  validates :name, presence: true
  # validates :floor_ids, acceptance: true
end