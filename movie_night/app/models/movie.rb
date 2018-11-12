class Movie < ApplicationRecord
    has_many :votes
    has_many :users, through: :votes
    accepts_nested_attributes_for :votes
end
