class CreateVotingRoundCandidates < ActiveRecord::Migration
  def change
    create_table :voting_round_candidates do |t|
      t.references :voting_round
      t.references :pitch
      t.timestamps
    end
  end
end
