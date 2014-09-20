class CohortPitchDay < ActiveRecord::Base
  has_many :pitches, -> { order(:id) }
  has_many :voting_rounds

end

