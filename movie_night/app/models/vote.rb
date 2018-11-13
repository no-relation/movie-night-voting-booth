class Vote < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    validate :not_duplicate


    def not_duplicate
        found_vote = Vote.find_by(user_id: self.user_id, movie_id: self.movie_id) 
        if found_vote 
            if found_vote.up == self.up 
                errors.add(:vote, "already voted!")
                false
            else 
                true
            end 
        else 
            true
        end
    end
end
