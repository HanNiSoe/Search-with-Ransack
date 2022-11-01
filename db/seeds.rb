# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# movie category
MovieCategory.create!(name: "Action")
MovieCategory.create!(name: "Adventure")
MovieCategory.create!(name: "Comedy")
MovieCategory.create!(name: "Fantasy")
MovieCategory.create!(name: "Horror")
MovieCategory.create!(name: "Mystery")
MovieCategory.create!(name: "Romance")
MovieCategory.create!(name: "Science fiction")
MovieCategory.create!(name: "Sports")

1000.times do |index|
    movie = Movie.new
    movie.name= Faker::Movie.title 
    movie.caption = [Faker::TvShows::SiliconValley.quote,Faker::Quote.yoda,Faker::Quote.matz,Faker::TvShows::Simpsons.quote,Faker::Quotes::Shakespeare.hamlet_quote,Faker::TvShows::BigBangTheory.quote].sample
    movie.director = [Faker::TvShows::SiliconValley.character,Faker::Movies::Lebowski.actor,Faker::Movies::Lebowski.character,Faker::Movies::HarryPotter.character,Faker::TvShows::Simpsons.character].sample 
    movie.category_id = rand(1..9)
    movie.price = 2.times.map{rand(1..9)}.join + "000"
    movie.save(validate: false)  

    movie_detail = MovieDetail.new
    movie_detail.movie_id = movie.id
    movie_detail.released_year = Faker::Date.backward(days: rand(30..12000))
    movie_detail.total_income = 2.times.map{rand(3..9)}.join + "000000"
    movie_detail.producer = Faker::Company.name
    movie_detail.stock = Faker::Boolean.boolean(true_ratio: 0.8)
    movie_detail.save(validate: false) 

    rand(1..2).times do
        movie_song = MovieSong.new
        movie_song.movie_id = movie.id
        movie_song.song_name = [Faker::Music::RockBand.song,Faker::Music::GratefulDead.song,Faker::Music::Prince.song,Faker::Music::Rush.album,Faker::Music::PearlJam.song].sample
        movie_song.singer_name = [Faker::Music::Prince.band,Faker::Music::GratefulDead.player,Faker::Music::Hiphop.artist,Faker::Music::Hiphop.groups,Faker::Music.band].sample
        movie_song.save(validate: false)  
    end
end
p "Created #{Movie.count} movies."
p "Created #{MovieDetail.count} movie details."
p "Created #{MovieSong.count} movie songs."
