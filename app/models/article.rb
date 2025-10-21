class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
# These two declarations enable a good bit of automatic behavior. For example, if you have an instance variable @article containing an article,
#  you can retrieve all the comments belonging to that article as an array using @article.comments.end
