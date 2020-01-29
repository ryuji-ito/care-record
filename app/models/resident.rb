class Resident < ApplicationRecord
  belongs_to :floor
  has_many :records
  belongs_to :user
  validates :name, presence: true
end