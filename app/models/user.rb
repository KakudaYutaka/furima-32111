class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :email,           uniqueness: true
    validates :password,        format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, allow_blank: true, message: 'Include both letters and numbers' }
    validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true, message: 'Full-width characters' }
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true, message: 'Full-width characters' }
    validates :kana_last_name,  format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: 'Full-width katakana characters' }
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: 'Full-width katakana characters' }
    validates :birth
  end
end
