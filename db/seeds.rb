# Add seed data here. Seed your database with `rake db:seed`

LibraryParser.parse

sg = Artist.create(name: "Spice Girls")
wb = Song.create(name: "Wannabe", artist: sg)
pop = Genre.create(name: "Pop")
SongGenre.create(song: wb, genre: pop)