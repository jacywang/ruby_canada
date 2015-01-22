class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :votes, as: :voteable

  validates :body, presence: true
end