class AddDescriptionToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :description, :text, after: :name
  end
end
