require 'rails_helper'

RSpec.describe VotingRound, :type => :model do

  let (:candidates) {[1,3,4,5,6]}

  before(:each) do
    day = Random.new.rand(1000)
    @vr = VotingRound.create_with_candidates(day, candidates)
  end
  
  it "creates a round with candidates" do
    expect(@vr.candidates.map { |cnd| cnd.pitch_id } ).to match_array(candidates)
    expect(@vr.round_number).to eq(1)
  end

  it "can add and delete candidates" do
    new_candidates = [2,3,4,6,7]
    @vr.update_candidates new_candidates
    expect(@vr.candidates.map { |cnd| cnd.pitch_id } ).to match_array(new_candidates)

  end

  it "can delete all candidates" do
    new_candidates = []
    @vr.update_candidates new_candidates
    expect(@vr.candidates.map { |cnd| cnd.pitch_id } ).to match_array(new_candidates)

  end


end
