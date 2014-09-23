class Pitch < ActiveRecord::Base
  belongs_to :pitch_day
  has_many :voting_round_candidates
end
