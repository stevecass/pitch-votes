class PitchesController < ApplicationController
  def create
    pitch = Pitch.new(pitch_params)
    if pitch.save
      render partial: 'pitch', locals: {pitch: pitch, day: pitch.pitch_day}
    else
      render text: "Error", status: :bad_request
    end

  end
  
  def destroy
    pitch = Pitch.find(params[:id])
    if pitch.destroy
      redirect_to pitch_day_path(pitch.pitch_day), notice: 'Pitch deleted'
    else
      redirect_to pitch_day_path(pitch.pitch_day), alert: 'Failed to delete pitch'
    end
  end

  def pitch_params
    params.require(:pitch).permit(:pitch_day_id, :proposer, :name, :description)
  end
end