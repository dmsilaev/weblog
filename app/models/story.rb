# -*- encoding : utf-8 -*-
class Story < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :url, presence: true, uniqueness: true, url: true
  validates :title, presence: true
  validates :tag_list, presence: true

  state_machine initial: :new do
    state :published

    event :publish do
      transition new: :published
    end
  end
end
