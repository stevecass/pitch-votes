class PitchesController < ApplicationController
  def create
    pitch = Pitch.new(pitch_params)
    if pitch.save
      render partial: 'pitch', locals: {pitch: pitch}
    else
      render text: "Error", status: :bad_request
    end

  end

  def pitch_params
    params.require(:pitch).permit(:pitch_day_id, :proposer, :name, :description)
  end
end