class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :overview
      t.string :poster_path
      t.string :tmdb_id
      t.timestamps
    end
  end
end
