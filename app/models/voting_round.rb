class VotingRound < ActiveRecord::Base
  belongs_to :pitch_day
  has_many :voting_round_candidates

  def self.max_for_day day
    VotingRound.where(pitch_day: day).maximum("id")
  end

  def self.create_with_candidates(day_id, candidate_ids)
    vr = VotingRound.new({ pitch_day_id: day_id })
    vr.round_number = VotingRound.max_for_day(day_id)
    vr.save
    candidate_ids.each do |id|
      vr.voting_round_candidates << VotingRoundCandidate.create({ pitch_id: id})
    end
    vr
  end

end

