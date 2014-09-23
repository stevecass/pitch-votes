class BallotPapersController < ApplicationController
  def new
    round_id = session[:round_id]
    @round = VotingRound.find(round_id)
    raise "Voting round #{round_id} is closed " unless @round.is_open

  end

  def create
    #
  end
end