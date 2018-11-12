class VotesController < ApplicationController
    before_action :define_current_vote
    
    def new
        @users = User.all
        @movies = Movie.all
    end

    def create
        Vote.create(vote_params)
        redirect_to movies_path
    end
    
    def index
        @votes = Vote.all
    end
    
    def update
        @vote.update(vote_params)
        redirect_to @vote
    end
    
    def destroy
        @vote.destroy
        redirect_to votes_path
    end
    
    def define_current_vote
        if params[:id]
            @vote = Vote.find(params[:id])
        else
            @vote = Vote.new
        end
    end
    
    def vote_params
        params.require(:vote).permit(:up, :user_id, :movie_id)
    end
end
