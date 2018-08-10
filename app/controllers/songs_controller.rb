require 'pry'
require 'byebug'

class SongsController < ApplicationController

set :views, 'app/views/songs'


get '/songs' do
  @songs = Song.all
  erb :index
end

get '/songs/new' do
  @genres = Genre.all
  erb :new
end

get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb :show
end


post '/songs' do
  @new_song = Song.new
  @new_song.name = params[:song][:name]
  # binding.pry
  artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
  @new_song.artist = artist
  @new_song.save

  params[:genres].each do |x|
    SongGenre.create(genre_id: x, song_id: @new_song.id)
  end

  # binding.pry
  # puts nil
  # byebug
  s = @new_song.slug
  redirect to "/songs/#{s}"
  # erb :test
end


end
