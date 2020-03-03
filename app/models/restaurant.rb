class Restaurant < ApplicationRecord
  belongs_to :user

  validates :name, :address, presence: true
  has_many :comments, dependent: :destroy
end
