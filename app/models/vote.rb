class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voting_round
  belongs_to :candidate
  
  def self.delete_for_user_and_round(user, round_id)
    Vote.delete_all(user: current_user, voting_round: round_id)
  end

end

