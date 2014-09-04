class VotingRoundCandidate < ActiveRecord::Base
  belongs_to :voting_round
  belongs_to :pitch
  has_many :voting_round_votes
end

