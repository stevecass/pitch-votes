class CreateVotingRounds < ActiveRecord::Migration
  def change
    create_table :voting_rounds do |t|
      t.references :pitch_day
      t.integer :round_number
      t.timestamps
    end
  end
end
