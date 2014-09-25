class Day < ActiveRecord::Base
  has_many :pitches, -> { order(:id) }, :dependent => :restrict_with_exception
  has_many :voting_rounds, :dependent => :restrict_with_exception
  validates_presence_of :cohort_name, :location, :pitch_date

  def self.default_order
    order('pitch_date desc, location desc')
  end
end

