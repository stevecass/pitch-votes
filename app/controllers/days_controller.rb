class DaysController < ApplicationController
  def index
    @days = PitchDay.all
  end

  def show
    @day = PitchDay.find_by_id(params[:id])
    @pitch=Pitch.new
  end

  def new
    @day = PitchDay.new
  end

  def create
    @day = PitchDay.create(day_params)
    if @day.save
      redirect_to days_path, notice: 'New day saved'
    else
      render 'new'
    end
  end

  def day_params
    params.require(:pitch_day).permit(:cohort_name, :location, :pitch_date)
  end

end
