class MoviesController < ApplicationController
    before_action :define_current_movie
    
    def create
        Movie.create(movie_params)
        redirect_to movies_path
    end
    
    def index
        @movies = Movie.all
    end

    def show
        @vote = Vote.new
    end
    
    def update
        @movie.update(movie_params)
        redirect_to @movie
    end
    
    def destroy
        @movie.destroy
        redirect_to movies_path
    end
    
    def define_current_movie
        if params[:id]
            @movie = Movie.find(params[:id])
        else
            @movie = Movie.new
        end
    end
    
    def movie_params
        params.require(:movie).permit(:title, :url)
    end
end
