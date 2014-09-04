class CreateVotingRounds < ActiveRecord::Migration
  def change
    create_table :voting_rounds do |t|
      t.references :cohort_pitch_day
      t.integer :round_number
      t.timestamps
    end
  end
end
