require('pry')
require_relative('../models/album')
require_relative('../models/artist')

artist1=Artist.new("name" => "Dizzie")
artist1.save()

album1=Album.new({
  'title' => 'Boy in the corner',
  'genre' => 'Grime',
  'artist_id' => artist1.id
})


album1.save()

binding.pry
nil
