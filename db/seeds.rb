# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete databse so you can start from the top of the table 
User.delete_all
Category.delete_all
Tag.delete_all
Post.delete_all
Comment.delete_all

# User Creations 
@jalena = User.create(first_name: 'Jalena', last_name: 'Lee', email: 'jalena@example.com')
@johnny_appleseed = User.create(first_name: 'Johnny', last_name: 'Appleseed', email: 'johnnyappleseed@example.com')
@chad = User.create(first_name: 'Chad', last_name: 'Robertson', email: 'chadrobertson@example.com')

# Category Creations 
@dev_degree = Category.create(name: 'Learning')
@life = Category.create(name: 'Life')
@school = Category.create(name: 'Life at Carleton')

# Tag Creations
@rails = Tag.create(name: 'Rails')
@fitness = Tag.create(name: 'Fitness')
@coding = Tag.create(name: 'Coding')
@foods = Tag.create(name: 'Food')
@bubbletea = Tag.create(name: 'Bubble Tea')
@shopify = Tag.create(name: 'Shopify')
@carleton = Tag.create(name: 'Carleton')
@fun_in_Ottawa = Tag.create(name: 'Fun Things To Do In Ottawa')
@braingains = Tag.create(name: 'Big Brain Gains')

# Post Creations 
# DateTime.new(YYYY, MM, DD, hh, mm, ss)
@comp1405post = Post.create(title: 'COMP1406', content: 'This course honestly turned out the best!', date: DateTime.new(2020, 1, 10, 23, 46, 0), user_id: @jalena.id, category_id: @school.id)
@another_post = Post.create(title: 'Sample', content: 'This is some sample post.Yay! We love rails. Here are some more words so that is more clear', date: DateTime.new(2020, 1, 12, 14, 12, 2), user_id: @johnny_appleseed.id, category_id: @life.id)
@chad_post = Post.create(title: 'Chad Bro in Tech', content: 'This is your guide to success yay', date: DateTime.new(2020, 1, 12, 14, 12, 2), user_id: @jalena.id, category_id: @school.id) 

# Comment Creations 
@comment_rand = Comment.create([{date: DateTime.now(), content: 'This is awesome! Keep it up!', user_id: @jalena.id, post_id: @comp1405post.id}, {date: DateTime.now(), content: 'This is also awesome! Keep it up!', user_id: @johnny_appleseed.id, post_id: @another_post.id}, {date: DateTime.now(), content: 'Mannsplaining blah blah blah... Let me know how I can be helpful.', user_id: @chad.id, post_id: @another_post.id}])

# Tag Creations 
@comp1405post.tags << @carleton << @coding << @rails << @shopify
@another_post.tags << @bubbletea << @foods << @fun_in_Ottawa << @shopify
@chad_post.tags << @shopify << @coding << @braingains

# @jalena = User.create(first_name: ‘Jalena’, last_name: ‘Lee’, email: 'jalena@example.com’)
# @learning = Category.create(name: ‘Learning’)
# @carleton = Tag.create(name: ‘Carleton’)
# # DateTime.new(YYYY, MM, DD, hh, mm, ss)
# @post = Post.create(title: ‘COMP1406’, content: ‘This course is a random example.’, date: DateTime.new(2020, 1, 10, 23, 46, 0), user_id: @jalena.id, category_id: @learning.id)
# @post.tags << @carleton


