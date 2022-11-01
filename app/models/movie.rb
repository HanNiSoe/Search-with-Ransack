class Movie < ApplicationRecord
    has_one :movie_detail, foreign_key: "movie_id", dependent: :destroy
    has_many :movie_songs, foreign_key: "movie_id", dependent: :destroy

    private

    ransacker :category_id do
        Arel.sql("to_char(\"#{table_name}\".\"category_id\", '99999')")
    end

    # ransacker :released_year , type: :date do
    #     Arel.sql('year(released_year)')
    # end
end
