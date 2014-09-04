class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.references :cohort_pitch_day
      t.string :proposer
      t.string :name
      t.timestamps
    end
  end
end
