class AddSubmitterToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :submitter, foreign_key: true
  end
end
