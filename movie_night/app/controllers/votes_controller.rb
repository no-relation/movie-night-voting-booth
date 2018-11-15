class VotesController < ApplicationController
    before_action :define_current_vote
    
    def new
        @users = User.all
        @movies = Movie.all
    end

    def tally
        @movies = Movie.sorted_by_vote
    end

    def create
        @vote = Vote.new(vote_params)
        if @vote.valid?
            @vote.save
            if @vote.up
                flash[:info] = "Movie upvoted"
            else
                flash[:danger] = "Movie downvoted"
            end
            redirect_to movie_path(@vote.movie)
        else
            redirect_to movie_path(@vote.movie)
            flash[:dark] = "You already voted on this"
        end
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



    private
    
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
