class Movie < ApplicationRecord
    has_many :votes
    has_many :users, through: :votes
    accepts_nested_attributes_for :votes

    def tally 
        total = 0
        self.votes.each do |vote|
            vote.up ? total += 1 : total -= 1
        end
        return total
    end

    def self.sorted_by_vote
        self.all.sort_by { |movie| movie.tally }.reverse
    end
end
