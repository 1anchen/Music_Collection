require_relative('artist')
require_relative('../db/sql_runner')

class Album

attr_reader :id, :artist_id
attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO album (title, genre, artist_id)
         VALUES ($1,$2,$3)
         RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM album"
    results = SqlRunner.run(sql)
    album_array = results.map{|result| Album.new(result)}
    return album_array
  end



  def artist()
    sql = "SELECT * FROM artist WHERE id = $1"
    values = [@artist_id]
    result_hash = SqlRunner.run(sql,values).first()
    return Artist.new(result_hash)
  end

  def update()
    sql = "UPDATE album SET (title,
    genre) = ($1,$2) WHERE id = $3"
    values = [@title,@genre,@id]
    album_update = SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM album WHERE id =$1 "
    values = [@id]
    SqlRunner.run(sql,values)

  end

end
