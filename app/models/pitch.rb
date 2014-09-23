class Pitch < ActiveRecord::Base
  belongs_to :day
  has_many :voting_round_candidates
end
