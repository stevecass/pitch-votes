class ResultsController < ApplicationController
  def show
    @round  = VotingRound.find(params[:round_id])
    @scores = Hash.new
    @votes = Vote.joins(:candidate).joins(:voting_round).where('voting_rounds.id = ?', @round.id)
    populate_scores @votes
    @scores = @scores.sort_by {|key, value| value}.reverse
  end

private

    def populate_scores votes
      votes.each do |vote|
        if vote.rank < 10
          key = vote.candidate.pitch.name
          vote_value = 2 ** (10 - vote.rank)
          new_value = vote_value +  (@scores[key] || 0)
          @scores[key] = new_value
        end
      end
    end

end