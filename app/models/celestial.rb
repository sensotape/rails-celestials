class Celestial < ApplicationRecord

  CATEGORIES = %w[nebula star planet black\ hole asteroid moon]

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :interests

  validates :name, presence: true, length: { in: 1..50 }
  validates :price, presence: true, numericality: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :location, presence: true, length: { in: 8..120 }
end
