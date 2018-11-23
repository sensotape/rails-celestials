class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :celestials, through: :interests
  has_many :celestials, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :messages
  has_many :conversations

  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name, presence: true, length: { maximum: 35 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
