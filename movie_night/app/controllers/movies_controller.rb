class MoviesController < ApplicationController
    before_action :define_current_movie
    
    def new
        @users = User.all
    end

    def find
        if params[:q]
            json = Movie.search(params[:q])
            @results = json["results"].shift(5).map do | result |
                Movie.json_to_params(result)
            end
        end
    end

    def create
        inescapable = eval(params[:movie])
        inescapable[:submitter_id] = current_user.id
        movie = Movie.find_or_initialize_by(title: inescapable[:title]) do | new_movie | 
            new_movie.assign_attributes(inescapable)
        end

        # sets true if movie is new to the database
        is_old = !!movie.id
        movie.save

        if is_old
            redirect_to movies_path
            flash[:notice] = "Movie already added, upvoting instead"
        else
            redirect_to movies_path
            flash[:success] = "Movie added"
        end
        
        Vote.create(up: true, user_id: inescapable[:submitter_id], movie_id: movie.id)
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
        params.require(:movie).permit(:title, :year, :submitter_id, :overview, :poster_path, :tmdb_id, :id)
    end

    def api_params
        params.permit(:title, :year, :submitter_id, :overview, :poster_path, :tmdb_id, :id)
    end
end
