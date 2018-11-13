module ApiCommunicator
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

end