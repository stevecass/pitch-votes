class DaysController < ApplicationController
  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
    @pitch=Pitch.new
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.create(day_params)
    if @day.save
      redirect_to days_path, notice: 'New day saved'
    else
      render 'new'
    end
  end
  
  def destroy
    @day = Day.find(params[:id])
    if @day.pitches.length > 0
      redirect_to days_path, alert: "Can't delete a pitch day once pitches are added."
    else
      @day.destroy
      redirect_to days_path, notice: "Removed pitch day #{@day.id}"
    end
  end

  def day_params
    params.require(:day).permit(:cohort_name, :location, :pitch_date)
  end

end
