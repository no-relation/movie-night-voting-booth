class MoviesController < ApplicationController
    before_action :define_current_movie
    
    def new
        @users = User.all
    end

    def create
        movie = Movie.create(movie_params)
        Vote.create(up: true, user_id: params[:movie][:submitter_id], movie_id: movie.id)
        redirect_to movies_path
    end
    
    def index
        @movies = Movie.all
    end
    
    def show
        @users = User.all
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

    private
    
    def define_current_movie
        if params[:id]
            @movie = Movie.find(params[:id])
        else
            @movie = Movie.new
        end
    end
    
    def movie_params
        params.require(:movie).permit(:title, :url, :submitter_id)
    end
end
