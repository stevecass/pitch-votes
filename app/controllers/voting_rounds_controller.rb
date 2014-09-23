class VotingRoundsController < ApplicationController
  
  def index
    day_id = params[:cohort_pitch_day_id]
    @day = CohortPitchDay.find(day_id)
    @rounds = VotingRound.where(cohort_pitch_day_id: day_id).order('id desc')
  end

  def show
    @round = VotingRound.find(params[:id])
    if (@round.is_open)
      session[:round_id] = @round.id
      redirect_to new_ballot_paper_path
    else
      #show the results for this round
    end
  end
end