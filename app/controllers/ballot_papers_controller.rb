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
    round = VotingRound.find(params[:round_id])
    Vote.delete_for_user_and_round(current_user, round)
    cand_array = params[:votes].split(',')
    cand_array.each_with_index do |item, index|
      rank = 1 + index
      Vote.create({candidate_id: item, rank: rank, user:current_user, voting_round: round})
    end
    redirect_to action: :show , round_id: round
  end

  def show
    @round = VotingRound.find(params[:round_id])
    @votes = Vote.for_user_and_round(current_user, @round )


  end

  private 

  def get_current_round
    round_id = params[:round_id]
    round_id = session[:round_id] if (!round_id)
    round_id
  end



end