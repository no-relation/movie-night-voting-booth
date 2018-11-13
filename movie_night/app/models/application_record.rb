class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def url_slug(query)
    query.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def tmdb_api_url(query)
    "https://api.themoviedb.org/3/search/movie?api_key=de368b3f60ee91a81d25727a7439ca26&language=en-US&query=#{url_slug(query)}&page=1&include_adult=false"
  end

  def movie_search(query)
    JSON.parse(RestClient.get(tmdb_api_url(query)))
  end
end
