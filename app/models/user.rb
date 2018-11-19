class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :celestials, through: :interests
  has_many :celestials
  has_many :interests
  has_many :messages, through: :interests

  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name, presence: true, length: { maximum: 35 }
end
