class DaysController < ApplicationController
  def index
    @days = CohortPitchDay.all
  end

  def show
    @day = CohortPitchDay.find_by_id(params[:id])
  end

  def new
    @day = CohortPitchDay.new
  end
end
