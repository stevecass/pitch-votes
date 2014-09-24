class BallotPapersController < ApplicationController
  def new
    round_id = get_current_round

    if (round_id)
      @round = VotingRound.find(round_id)
      
    else
      @rounds = VotingRound.open_rounds
    end

  end

  def create
    #
  end

  private 

  def get_current_round
    round_id = params[:round_id]
    round_id = session[:round_id] if (!round_id)
    round_id
  end

  def place_candidates
  end


end