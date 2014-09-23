class DaysController < ApplicationController
  def index
    @days = PitchDay.all
  end

  def show
    @day = PitchDay.find(params[:id])
    @pitch=Pitch.new
  end

  def new
    @day = PitchDay.new
  end

  def create
    @day = PitchDay.create(day_params)
    if @day.save
      redirect_to pitch_days_path, notice: 'New day saved'
    else
      render 'new'
    end
  end
  
  def destroy
    @day = PitchDay.find(params[:id])
    if @day.pitches.length > 0
      redirect_to pitch_days_path, alert: "Can't delete a pitch day once pitches are added."
    else
      @day.destroy
      redirect_to pitch_days_path, notice: "Removed pitch day #{@day.id}"
    end
  end

  def day_params
    params.require(:pitch_day).permit(:cohort_name, :location, :pitch_date)
  end

end
