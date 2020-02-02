class FloorResident < ApplicationRecord
  belongs_to :floor
  belongs_to :resident
end
