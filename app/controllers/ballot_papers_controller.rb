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
    Vote.delete_for_user_and_round(current_user, params[:round_id])
    cand_array = params[:votes].split(',')
    cand_array.each_with_index do |item, index|
      rank = 1 + index
      Vote.create({voting_round_candidate_id: item, rank: rank, user:current_user})
    end
    redirect_to '/', notice: 'Thanks for voting.'

  end

  private 

  def get_current_round
    round_id = params[:round_id]
    round_id = session[:round_id] if (!round_id)
    round_id
  end



end