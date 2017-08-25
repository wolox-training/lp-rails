class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # Hooks
  before_validation :generate_verification_code, on: :create

  has_many :rents

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    return user if user
    User.create!(first_name: data['name'],
                 last_name: data['name'],
                 email: data['email'],
                 password: Devise.friendly_token[0, 20])
  end
end
