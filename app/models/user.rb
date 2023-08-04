class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, presence: true
  validates :birth_date, presence: true
end
