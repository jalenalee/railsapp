class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
end
