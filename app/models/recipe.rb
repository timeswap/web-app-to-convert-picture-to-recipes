class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  validates :title, :description, :ingredients, presence: true
end
