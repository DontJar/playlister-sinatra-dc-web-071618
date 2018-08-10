class ArtistsController < ApplicationController

  set :views, 'app/views/artists'


  get '/artists' do
    @artists = Artist.all
    # binding.pry
    erb :index
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])

    erb :show
  end



end

# /artists
#       responds with a 200 status code (FAILED - 4)
#       displays a list of artists (FAILED - 5)
#       contains links to each artist's show page (FAILED - 6)
