class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true,
                       length: { minimum: 4 }

  validates_uniqueness_of :email

  def self.authenticate_with_credentials(email, password)
    # email_lowercase_stripped = email.downcase.strip
    # @user = User.find_by_email(email_lowercase_stripped)
    @user = User.where('lower(email) = lower(?)', email.strip).first

    if @user && @user.authenticate(password)
      @user
    else
      false
    end
  end
end
