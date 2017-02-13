# Represents a Mineswipper game
class Game < ApplicationRecord
  belongs_to :user
  alias_attribute :owner, :user

  before_create :generate!

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
    calculate_near_mines
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
    return if x < 0 or x > width
    return if y < 0 or y > height
    grid[(y * width) + x] == '*'
  end

  def cell_at(x, y)
    return if x < 0 or x > width
    return if y < 0 or y > height
    grid[(y * width) + x]
  end

  def value_at_cell(x, y, value)
    return if x < 0 or x >= width
    return if y < 0 or y >= height
    grid[(y * width) + x] = value
  end

  def calculate_near_mines
    (0..width-1).each do |x|
      (0..height-1).each do |y|
        next if mine_at?(x, y)
        value = 0

        value += 1 if mine_at?(x-1, y)
        value += 1 if mine_at?(x+1, y)
        value += 1 if mine_at?(x, y-1)
        value += 1 if mine_at?(x, y+1)
        value += 1 if mine_at?(x-1, y-1)
        value += 1 if mine_at?(x+1, y-1)
        value += 1 if mine_at?(x-1, y+1)
        value += 1 if mine_at?(x+1, y+1)
        value_at_cell x, y, value.to_s
      end
    end
    grid
  end
end
