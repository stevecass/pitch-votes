class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :cohort_name
      t.string :location
      t.date :pitch_date
      t.timestamps
    end
  end
end
