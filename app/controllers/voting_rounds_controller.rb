class VotingRoundsController < ApplicationController
  
  def index
    day_id = params[:cohort_pitch_day_id]
    @day = CohortPitchDay.find(day_id)
    @rounds = VotingRound.find_by_cohort_pitch_day_id(day_id)
    
  end
end