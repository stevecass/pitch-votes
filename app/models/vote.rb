class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voting_round
  belongs_to :candidate
  
  def self.delete_for_user_and_round(user, round)
    Vote.delete_all(user: user, voting_round: round)
  end

  def self.for_user_and_round(user, round)
    Vote.includes(:candidate => :pitch).where(user: user).where(voting_round: round).order(:rank)
  end

end

