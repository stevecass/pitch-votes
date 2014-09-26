class PitchesController < ApplicationController

  def edit
    @day = Day.find(params[:day_id])
    @pitch = Pitch.find(params[:id])
  end

  def update
    @pitch = Pitch.find(params[:id])
    @pitch.update_attributes!(pitch_params)
    redirect_to day_path(@pitch.day_id)
  end

  def create
    pitch = Pitch.new(pitch_params)
    if pitch.save
      render partial: 'pitch', locals: {pitch: pitch, day: pitch.day}
    else
      render text: "Error", status: :bad_request
    end

  end
  
  def destroy
    pitch = Pitch.find(params[:id])
    if pitch.destroy
      redirect_to day_path(pitch.day), notice: 'Pitch deleted'
    else
      redirect_to day_path(pitch.day), alert: 'Failed to delete pitch'
    end
  end

  def pitch_params
    params.require(:pitch).permit(:day_id, :proposer, :name, :description)
  end
end