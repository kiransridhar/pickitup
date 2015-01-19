class AddGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
