class Interest < ApplicationRecord

  STATUSES = %w[pending accepted declined cancelled]

  belongs_to :celestial
  belongs_to :user
  has_many :messages
  has_one :conversation

  validates :status, presence: true, inclusion: { in: STATUSES }

  # scope :pending, -> { where(status: 'pending') }
end
