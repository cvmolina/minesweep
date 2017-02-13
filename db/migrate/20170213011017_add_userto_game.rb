class AddUsertoGame < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :user, index: true, foreign_key: true
  end
end
