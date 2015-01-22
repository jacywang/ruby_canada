class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :topic_categories
  has_many :categories, through: :topic_categories
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :content, presence: true
end 