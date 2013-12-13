# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  url         :string(255)
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  domain      :string(255)
#  state       :string(255)
#  host_id     :integer
#

# -*- encoding : utf-8 -*-
class Story < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  belongs_to :host

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

  def set_host!
    name = URI.parse(url).host.downcase
    host = Host.where(name: name).first || Host.create!(name: name)
    self.update_attribute(:host, host)
  end
end
