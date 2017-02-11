class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.integer :width
      t.integer :num_mines
      t.integer :height
      t.text :grid

      t.timestamps
    end
  end
end
