class AddTipoffTimeandTipoffDatetoGame < ActiveRecord::Migration
  def change
    add_column :games, :tip_time, :string
    add_column :games, :tip_date, :string
  end
end
