class Post < ApplicationRecord
  belongs_to :categories 
  belongs_to :users 
  has_many :tags through :taggings 

end
