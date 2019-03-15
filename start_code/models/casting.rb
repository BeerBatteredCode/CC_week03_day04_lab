require_relative('./movie')
require_relative('./performer')
require_relative('../db/sql_runner')

class Casting
  attr_reader :id
  attr_accessor :movie_id, :performer_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @performer_id = options['performer_id'].to_i
    @fee = options['fee'].to_i
  end

  def save
    sql = 'INSERT INTO castings (movie_id, performer_id, fee) VALUES ($1, $2, $3) RETURNING id'
    values = [@movie_id, @performer_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM movies'
    castings = SqlRunner.run(sql)
    return castings.map { |castings| Casting.new(castings) }
  end

  def update()
    sql = 'UPDATE castings SET fee = $1 WHERE id = $2'
    values = [@fee, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM castings WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM castings'
    SqlRunner.run(sql)
  end

end
