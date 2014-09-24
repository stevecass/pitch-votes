class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :voting_round
      t.references :voting_round_candidate
      t.integer :rank
      t.timestamps
    end
  end
end
