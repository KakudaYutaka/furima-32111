class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true }
  validates :kana_last_name,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :birth,           presence: true

  validates :password, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, allow_blank: true }
end
