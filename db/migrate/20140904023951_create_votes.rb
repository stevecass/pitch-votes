class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voting_round_candidate
      t.string :voter
      t.integer :rank
      t.timestamps
    end
  end
end
