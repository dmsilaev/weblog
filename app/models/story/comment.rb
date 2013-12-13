# == Schema Information
#
# Table name: story_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  story_id   :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  ancestry   :string(255)
#

class Story::Comment < ActiveRecord::Base
  has_ancestry

  belongs_to :user
  belongs_to :story

  validates :body, presence: true
  validates :story, presence: true
  validates :user, presence: true
end
