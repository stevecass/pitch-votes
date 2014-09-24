class VotingRound < ActiveRecord::Base
  belongs_to :day
  has_many :voting_round_candidates

  def self.max_for_day day
    VotingRound.where(day: day).maximum("id")
  end

  def self.open_rounds
    VotingRound.where(is_open: true)
  end

  def self.create_with_candidates(day_id, candidate_ids)
    vr = VotingRound.new({ day_id: day_id })
    vr.round_number = 1 + VotingRound.max_for_day(day_id)
    vr.save
    candidate_ids.each do |id|
      vr.voting_round_candidates << VotingRoundCandidate.create({ pitch_id: id})
    end
    vr
  end

end

