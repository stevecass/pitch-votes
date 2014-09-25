class VotingRound < ActiveRecord::Base
  belongs_to :day
  delegate :cohort_name, :location, :pitch_date, to: :day, allow_nil: true, prefix: false
  has_many :candidates
  has_many :votes

  def self.closed
    where(is_open: false)
  end
  
  def self.max_for_day day
    VotingRound.where(day: day).maximum("id")
  end

  def self.open_rounds
    VotingRound.where(is_open: true)
  end

  def self.create_with_candidates(day_id, candidate_ids)
    vr = VotingRound.new({ day_id: day_id })
    current_max = VotingRound.max_for_day(day_id)
    current_max = 0 if !current_max 
    vr.round_number = 1 + current_max
    vr.save
    candidate_ids.each do |id|
      vr.candidates << Candidate.create({ pitch_id: id})
    end
    vr
  end

end

