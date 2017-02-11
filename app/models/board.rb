class Board < ApplicationRecord
  validates_presence_of :width, :num_mines, :height
  validates :width, :height, numericality: { only_integer: true, greater_than: 1}
  validates :num_mines, numericality: { only_integer: true, greater_than: 0 }
end
