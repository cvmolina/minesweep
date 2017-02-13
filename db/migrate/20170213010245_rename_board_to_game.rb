class RenameBoardToGame < ActiveRecord::Migration[5.0]
  def change
    rename_table :boards, :games
  end
end
