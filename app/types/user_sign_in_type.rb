class UserSignInType
  include ApplicationTypeWithoutActiveRecord

  attribute :email_or_login, String
  attribute :password, String


  validates :email_or_login, presence: true
  validates :password, presence: true

  validates_each :email_or_login do |record, attr, value|
    user = record.user
    if user.try :new?
      record.errors.add(attr, :user_new)
    end

    if !user.try(:authenticate, record.password)
      record.errors.add(attr, :user_or_password_invalid)
    end
  end

  def user
    var_attr = (email_or_login.include?('@') ? :email : :login)
    ::User.where(var_attr => email_or_login).first
  end
end