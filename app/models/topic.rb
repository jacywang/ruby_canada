class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :topic_categories
  has_many :categories, through: :topic_categories
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :content, presence: true

  def total_votes
    up_votes - down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end
end 