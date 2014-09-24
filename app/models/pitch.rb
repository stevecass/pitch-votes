class Pitch < ActiveRecord::Base
  belongs_to :day
  has_many :candidates
end
