require_relative('album')
require_relative('../db/sql_runner')



class Artist

attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options ['name']
  end

   def save()
     sql = "INSERT INTO artist (name)
          VALUES ($1)
          RETURNING id"
     values = [@name]
     result = SqlRunner.run(sql,values)
     @id = result[0]['id'].to_i
   end

   def self.all()
     sql = "SELECT * FROM artist"
     results = SqlRunner.run(sql)
     artist_array = results.map{|result| Artist.new(result)}
     return artist_array
   end

   def albums()
     sql = "SELECT * FROM album WHERE artist_id =$1 "
     values = [@id]
     results = SqlRunner.run(sql,values)
     albums = results.map{|result| Album.new(result)}
     return albums
   end

   def self.find(id)
     sql = "SELECT * FROM artist WHERE id =$1 "
     values = [id]
     results = SqlRunner.run(sql,values)
     artists = results.map{|result| Artist.new(result)}
     return artists
   end






end
