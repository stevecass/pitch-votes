class Candidate < ActiveRecord::Base
  belongs_to :voting_round
  belongs_to :pitch
  has_many :votes
end

