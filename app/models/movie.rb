class Movie < ApplicationRecord
    extend ApiCommunicator

    has_many :votes, dependent: :destroy
    has_many :users, through: :votes
    belongs_to :submitter, class_name: "User"
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

    def poster_image
        
        config = HTTParty.get("https://api.themoviedb.org/3/configuration?api_key=de368b3f60ee91a81d25727a7439ca26").parsed_response
        images = config["images"]
        images["base_url"] + images["poster_sizes"][3] + self.poster_path
    end
end
