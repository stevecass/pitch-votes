class Day < ActiveRecord::Base
  has_many :pitches, -> { order(:id) }
  has_many :voting_rounds
  validates_presence_of :cohort_name, :location, :pitch_date

end

