class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :overview
      t.string :poster_path
      t.integer :tmdb_id
      t.timestamps
    end
  end
end
