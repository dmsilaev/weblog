class UserSignUpType < User
  include ApplicationType

  permit :email, :password, :password_confirmation,
         :first_name, :last_name, :login

  has_secure_password


  validates :password, presence: true,
                       on: :create,
                       length: { minimum: 6, maximum: 16 }

  validates :email, presence: true,
                    uniqueness: true,
                    email: true

  validates :login, presence: true,
                    uniqueness: true,
                    length: { minimum: 3, maximum: 10 }
  def user
    @user ||= User.find_by_email(email)
  end

end