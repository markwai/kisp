class Brief < ActiveRecord::Base
  #belongs_to :article
  belongs_to :briefable, polymorphic: true
  belongs_to :user
  has_many :comments
  has_many :votes

  validates :body, presence: true
  validates :body, length: { maximum: 1000 }

  def total_votes
    self.votes.size
  end
end