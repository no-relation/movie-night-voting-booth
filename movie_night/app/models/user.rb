class User < ApplicationRecord
    has_many :votes
    has_many :movies, through: :votes
    has_many :submitted_movies, :class_name => 'Movie', :foreign_key => 'submitter_id'
    has_secure_password

    ROLES = %w[user admin].freeze

    def is_admin
        self.role == "admin"
    end
    
end
