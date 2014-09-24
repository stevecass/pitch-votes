class Vote < ActiveRecord::Base
  belongs_to :voting_round_candidate
end

