# Represents a Mineswipper game board
class Board < ApplicationRecord
  validates_presence_of :width, :num_mines, :height
  validates :width, :height, numericality: { only_integer: true, greater_than: 1 }
  validates :num_mines, numericality: { only_integer: true, greater_than: 0 }
  validate :too_many_mines

  def to_a
    clean_board if grid.blank? || grid.size != width * height
    grid.scan(/.{#{width}}/).map(&:chars)
  end

  private

  def too_many_mines
    return unless num_mines && width && height
    return if num_mines < width * height
    errors.add :num_mines, 'too many mines for field size'
  end

  def clean_board
    self.grid = ' ' * width * height
  end
end
