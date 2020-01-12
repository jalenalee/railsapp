class Category < ApplicationRecord
  # posts because always plural when you are talking about the database 
  has_many :posts 

  # checks validation for the name 
  validates :name, presence: true, uniqueness: true 
end

# Category.create(id: "1234").valid? # => true 
# Category.create(id: nil).valid # => false 
