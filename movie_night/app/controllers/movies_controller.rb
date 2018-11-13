class MoviesController < ApplicationController
    before_action :define_current_movie
    
    def new
        @users = User.all
    end

    def create
        movie = Movie.find_or_initialize_by(title: movie_params[:title]) do | new_movie | 
            new_movie.assign_attributes(movie_params)
        end

        # Why doesn't this if statement work? 
        if movie.save
            redirect_to movie_path(movie)
            flash[:success] = "Movie added"
        else            
            redirect_to movies_path
            flash[:notice] = "Movie upvoted"
        end

        Vote.create(up: true, user_id: params[:movie][:submitter_id], movie_id: movie.id)
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
