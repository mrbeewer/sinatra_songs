require "bundler"
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "sinatra_songs"
)

get "/" do

  @songs = Songs.all

  erb :index

end


get "/create" do

  song = Songs.new
  song.artist = "Frank Sinatra"
  song.title = Faker::Book.title
  song.release_year = Faker::Number.between(1950, 1960)
  song.save

  return Songs.all.to_json

end
