class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  # when you delete the ppost it also deletes the comments 
  has_many :comments, dependent: :destroy 
end
