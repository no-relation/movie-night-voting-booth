module ApiCommunicator
    require 'httparty'

    def url_slug(query)
        query.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end    
    
    def tmdb_api_url(query)
        "https://api.themoviedb.org/3/search/movie?api_key=de368b3f60ee91a81d25727a7439ca26&language=en-US&query=#{url_slug(query)}&page=1&include_adult=false"
    end    
    
    def search(query)
        HTTParty.get(tmdb_api_url(query)).parsed_response
    end    
    
    def json_to_params(json_object)
        params = {
            title: json_object["title"], 
            year: json_object["release_date"][0,4],
            overview: json_object["overview"],
            poster_path: json_object["poster_path"],
            tmdb_id: json_object["id"]
        }
    end    
    
    @config_query = "https://api.themoviedb.org/3/configuration?api_key=de368b3f60ee91a81d25727a7439ca26"

    def config
        HTTParty.get(@config_query).parsed_response
    end

end