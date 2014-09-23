class DaysController < ApplicationController
  def index
    @days = CohortPitchDay.all
  end

  def show
    @day = CohortPitchDay.find_by_id(params[:id])
    @pitch=Pitch.new
  end

  def new
    @day = CohortPitchDay.new
  end

  def create
    @day = CohortPitchDay.create(day_params)
    if @day.save
      redirect_to days_path, notice: 'New day saved'
    else
      render 'new'
    end
  end

  def day_params
    params.require(:cohort_pitch_day).permit(:cohort_name, :location, :pitch_date)
  end

end
