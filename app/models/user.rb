# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  avatar          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  login           :string(255)
#

# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  rolify

  has_secure_password validations: false

  validates :email, uniqueness: true, presence: true, email: true

  validates :password_digest, presence: true


  has_many :stories, dependent: :destroy

  def guest?
    false
  end

  def admin?
    self.has_role? :admin
  end

  def self.random num = 1
    num.times.map { offset(rand(count)).limit(1) }
  end
end
