class Feed < ApplicationRecord
  belongs_to :animal
  belongs_to :food
  belongs_to :lot

  validates :firstDate, presence: true

end
