class Pitch < ActiveRecord::Base
  belongs_to :day
  delegate :cohort_name, :location, :pitch_date, to: :day, allow_nil: true, prefix: false
  has_many :candidates
end
