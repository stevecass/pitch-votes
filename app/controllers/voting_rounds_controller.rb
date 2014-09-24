class VotingRoundsController < ApplicationController
  skip_before_action :require_staff_login, only:[:index, :show]
  
  def index
    day_id = params[:day_id]
    @day = Day.find(day_id)
    @rounds = VotingRound.where(day_id: day_id).order('id desc')
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
      redirect_to day_voting_rounds_path, notice: 'Voting round created'
    else
      redirect_to day_voting_rounds_path, alert: 'Failed to create voting round created'
    end

  end
end