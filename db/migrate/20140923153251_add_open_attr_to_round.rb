class AddOpenAttrToRound < ActiveRecord::Migration
  def change
    add_column :voting_rounds, :is_open, :boolean, null: false, default: true
  end
end
