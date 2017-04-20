# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(email: 'jules@gmail.com', password: 'password')

band1 = Band.create(name: "Third Eye Blind")
band2 = Band.create(name: "Blink 182")
band3 = Band.create(name: "Matchbox 20")

album1 = Album.create(name: "Graduate", band_id: band1.id, recording_type: "studio")
album2 = Album.create(name: "Enema of the State", band_id: band2.id, recording_type: "studio")
album3 = Album.create(name: "Exile on Mainstream", band_id: band3.id, recording_type: "studio")

track1 = Track.create(album_id: album1.id, name: "Crystal Baller", track_type: "bonus", lyrics: "xoxoxoxoxoxo")
track2 = Track.create(album_id: album1.id, name: "Graduate", track_type: "regular", lyrics: "xzxzxz")
track3 = Track.create(album_id: album2.id, name: "All the Small Things", track_type: "bonus", lyrics: "sasasa")
track4 = Track.create(album_id: album2.id, name: "Cynical", track_type: "regular", lyrics: "vcvcvc")
track5 = Track.create(album_id: album3.id, name: "Overjoyed", track_type: "bonus", lyrics: "ytytyt")
