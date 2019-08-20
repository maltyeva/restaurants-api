class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :content, length: {minimum: 10}
end
