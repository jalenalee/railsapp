class Category < ApplicationRecord
  # posts because always plural when you are talking about the database 
  has_many :posts 
end
