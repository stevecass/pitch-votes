class VotingRound < ActiveRecord::Base
  belongs_to :cohort_pitch_day
  has_many :voting_round_candidates
end

