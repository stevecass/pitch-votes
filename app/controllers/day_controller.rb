class DayController < ApplicationController
  def index
    @days = CohortPitchDay.all
  end

  def show
    
  end
end
