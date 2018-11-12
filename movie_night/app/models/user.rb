class User < ApplicationRecord
    has_many :votes
    has_many :movies, through: :votes

end
