class Candidate < ActiveRecord::Base
  belongs_to :voting_round
  delegate :round_number, to: :voting_round, allow_nil: true, prefix: false
  belongs_to :pitch
  delegate :name, to: :pitch, allow_nil: true, prefix: true
  has_many :votes

end

