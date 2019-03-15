require_relative('models/movie')
require_relative('models/performer')
require_relative('models/casting')

# require('pry')

Performer.delete_all
Movie.delete_all

performer1 = Performer.new({ 'first_name' => 'Jake', 'last_name' => 'Gyllenhaal' })
performer2 = Performer.new({ 'first_name' => 'Bake', 'last_name' => 'Gyllenhamm' })
performer3 = Performer.new({ 'first_name' => 'Stake', 'last_name' => 'Baconhall' })
performer1.save
performer2.save
performer3.save

movie1 = Movie.new({ 'title' => 'Brokeback Mountain', 'genre' => 'Romance' })
movie2 = Movie.new({ 'title' => 'Brokeback Mountain 2', 'genre' => 'Romance' })
movie3 = Movie.new({ 'title' => 'Brokeback Mountain 3 XXX', 'genre' => 'Romance ++' })
movie1.save
movie2.save
movie3.save

movie3.title = 'Blade Runner'
movie3.genre = 'Sci-fi'
movie2.title = 'Smokeback'
movie3.update
movie2.update

performer1.first_name = 'Hake'
performer1.update

casting1 = Casting.new({
  'performer_id' => performer1.id,
  'movie_id' => movie1.id,
  'fee' => 500
})
casting1.save

casting2 = Casting.new({
  'movie_id' => movie2.id,
  'performer_id' => performer1.id,
  'fee' => 510
})
casting2.save

casting1.delete

movie1.performers

# binding.pry
# NIL
