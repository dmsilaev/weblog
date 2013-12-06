class Story::Comment < ActiveRecord::Base
  has_ancestry

  belongs_to :user
  belongs_to :story

  validates :body, presence: true
  validates :story, presence: true
  validates :user, presence: true
end
