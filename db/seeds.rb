# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@jalena = User.create(first_name: 'Jalena', last_name: 'Lee', email: 'jalena@example.com')
@learning = Category.create(name: 'Learning')
@carleton = Tag.create(name: 'Carleton')
# DateTime.new(YYYY, MM, DD, hh, mm, ss)
@post = Post.create(title: 'COMP1406', content: 'This course is a random example.', date: DateTime.new(2020, 1, 10, 23, 46, 0), user_id: @jalena.id, category_id: @learning.id)
@post.tags << @carleton