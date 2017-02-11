require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test 'board is invalid without attributes set' do
    board = Board.new
    assert_not board.valid?
    assert_not board.errors[:width].empty?
    assert_not board.errors[:height].empty?
    assert_not board.errors[:num_mines].empty?
  end

  test 'board is valid with attributes set' do
    board = Board.new width: 2, height: 2, num_mines: 1
    assert board.valid?
  end

  test 'board is valid with number of mines below board cells number' do
    (1..5).each do |num_mines|
      board = Board.new width: 2, height: 3, num_mines: num_mines
      assert board.valid?
    end
  end

  test 'board is invalid with too many mines' do
    [4, 5, 10, 100].each do |num_mines|
      board = Board.new width: 2, height: 2, num_mines: num_mines
      assert_not board.valid?
    end
  end

  test 'converting to an array with #to_a' do
    # TODO: avoid duplication
    board = Board.new width: 2, height: 2, num_mines: 2
    assert_equal board.to_a, [[' ', ' '], [' ', ' ']]
    board.to_a.flatten.each { |c| assert_valid_cell_value c }

    board = Board.new width: 2, height: 3, num_mines: 2
    assert_equal board.to_a, [[' ', ' '], [' ', ' '], [' ', ' ']]
    board.to_a.flatten.each { |c| assert_valid_cell_value c }

    board = Board.new width: 3, height: 2, num_mines: 2
    assert_equal board.to_a, [[' ', ' ', ' '], [' ', ' ', ' ']]
    board.to_a.flatten.each { |c| assert_valid_cell_value c }
  end

  private

  def assert_valid_cell_value(char)
    assert [' ', '*'].include?(char), 'not a cell value'
  end
end
