class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :caption
      t.string :director
      t.integer :category_id
      t.integer :price

      t.timestamps
    end
  end
end
