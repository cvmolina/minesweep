# Represents a Mineswipper game
class Game < ApplicationRecord
  belongs_to :user
  alias_attribute :owner, :user

  validates_presence_of :width, :num_mines, :height, :user
  validates :width, :height, numericality: { only_integer: true, greater_than: 1 }
  validates :num_mines, numericality: { only_integer: true, greater_than: 0 }
  validate :too_many_mines

  def to_a
    clean_game if grid.blank? || grid.size != width * height
    grid.scan(/.{#{width}}/).map(&:chars)
  end

  def generate!
    raise 'invalid game' unless valid?
    clean_game
    num_mines.times { plant_mine }
    grid
  end

  private

  def too_many_mines
    return unless num_mines && width && height
    return if num_mines < width * height
    errors.add :num_mines, 'too many mines for field size'
  end

  def clean_game
    self.grid = ' ' * width * height
  end

  def plant_mine
    begin
      x = rand width
      y = rand height
    end while mine_at? x, y
    grid[(y * width) + x] = '*'
  end

  def mine_at?(x, y)
    grid[(y * width) + x] == '*'
  end
end
