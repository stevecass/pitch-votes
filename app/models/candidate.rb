class Candidate < ActiveRecord::Base
  belongs_to :voting_round
  delegate :round_number, to: :voting_round, allow_nil: true, prefix: false
  belongs_to :pitch
  delegate :name, :proposer, to: :pitch, allow_nil: true, prefix: false
  has_many :votes, :dependent => :restrict_with_exception

end

