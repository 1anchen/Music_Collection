require('pry')
require_relative('../models/album')
require_relative('../models/artist')

artist1=Artist.new("name" => "Dizzie")
artist2=Artist.new("name" => "Dii")

artist1.save()
Artist.all()

album1=Album.new({
  'title' => 'Boy in the corner',
  'genre' => 'Grime',
  'artist_id' => artist1.id
})
album2=Album.new({
  'title' => 'Yaddayadda',
  'genre' => 'Grime',
  'artist_id' => artist1.id
})


album1.save()
album2.save()

binding.pry
nil
