class VotingRoundsController < ApplicationController
  
  def index
    day_id = params[:day_id]
    @day = Day.find(day_id)
    @rounds = VotingRound.where(day_id: day_id).order('id desc')
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

  def new
    @day = Day.find(params[:day_id])
    @voting_round = VotingRound.new
  end

  def create
    day_id = params[:day_id]
    pitch_ids = []
    params[:pitches].each do |k,v|
      pitch_ids.push k[1..-1]
    end
    vr = VotingRound.create_with_candidates(day_id, pitch_ids)
    if vr.save
      
    end

  end
end