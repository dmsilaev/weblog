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
