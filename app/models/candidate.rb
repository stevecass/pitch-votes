class Candidate < ActiveRecord::Base
  belongs_to :voting_round
  delegate :round_number, to: :voting_round, allow_nil: true, prefix: false
  belongs_to :pitch
  delegate :name, :proposer, to: :pitch, allow_nil: true, prefix: false
  has_many :votes, :dependent => :restrict_with_exception

  def self.pitch_ids_for_round round_id
    where(voting_round_id: round_id).pluck(:pitch_id)
  end

  def self.delete_pitches_from_round round_id, pitch_ids
    arr = where(voting_round_id:round_id).where(pitch_id:pitch_ids).pluck(:id)
    delete(arr)
  end

end

