class CreateMovieDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_details do |t|
      t.belongs_to :movie
      t.date :released_year 
      t.integer :total_income
      t.string :producer
      t.boolean :stock, default: false, null: false
      t.timestamps
    end
  end
end
