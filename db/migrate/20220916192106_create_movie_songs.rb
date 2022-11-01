class CreateMovieSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_songs do |t|
      t.belongs_to :movie
      t.string :song_name
      t.string :singer_name
      t.timestamps
    end
  end
end
