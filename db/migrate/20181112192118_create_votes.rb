class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.boolean :up
      t.belongs_to :user
      t.belongs_to :movie
      t.timestamps
    end
  end
end
