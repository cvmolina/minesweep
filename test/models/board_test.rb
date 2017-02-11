require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "board is invalid without attributes set" do
    board = Board.new
    assert_not board.valid?
    assert_not board.errors[:width].empty?
    assert_not board.errors[:height].empty?
    assert_not board.errors[:num_mines].empty?
  end

  test "board is valid with attributes set" do
    board = Board.new width: 2, height: 2, num_mines: 1
    assert board.valid?
  end
end
