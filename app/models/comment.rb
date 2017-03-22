class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates :comment_text, presence: true
end
