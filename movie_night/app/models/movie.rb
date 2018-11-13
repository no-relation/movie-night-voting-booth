class Movie < ApplicationRecord
    includes ApiCommunicator

    has_many :votes
    has_many :users, through: :votes
    belongs_to :submitter, class_name: "User"
    accepts_nested_attributes_for :votes

    require 'httparty'
    def self.url_slug(query)
        query.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.tmdb_api_url(query)
        "https://api.themoviedb.org/3/search/movie?api_key=de368b3f60ee91a81d25727a7439ca26&language=en-US&query=#{url_slug(query)}&page=1&include_adult=false"
    end

    def self.search(query)
        HTTParty.get(tmdb_api_url(query)).parsed_response
    end

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
