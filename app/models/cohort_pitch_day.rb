class CohortPitchDay < ActiveRecord::Base
  has_many :pitches
  has_many :voting_rounds
end
