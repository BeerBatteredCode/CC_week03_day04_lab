require_relative('../db/sql_runner')
require_relative('movie')



class Performer
  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save
    sql = 'INSERT INTO performers (first_name, last_name) VALUES ($1, $2) RETURNING id'
    values = [@first_name, @last_name]
    performer = SqlRunner.run(sql, values).first
    @id = performer['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM performers'
    performers = SqlRunner.run(sql)
    return performers.map { |performers| Performer.new(performers) }
  end

  def update()
    sql = 'UPDATE performers SET (first_name, last_name) = ($1, $2) WHERE id = $3'
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM performers WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM performers'
    SqlRunner.run(sql)
  end

  def movies
    sql = 'SELECT movies.* FROM movies INNER JOIN castings ON movies.id = castings.movies_id WHERE performer_id = $1'
    values = [@id]
    movie_data = SqlRunner.run(sql, values)
    return movie_data.map { |hash| Movie.new(hash) }
  end

end
