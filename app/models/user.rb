class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Hooks
  before_validation :generate_verification_code, on: :create

  has_many :rents

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end
end
