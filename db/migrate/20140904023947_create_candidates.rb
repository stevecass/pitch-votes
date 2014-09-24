class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.references :voting_round
      t.references :pitch
      t.timestamps
    end
  end
end
