class Message < ApplicationRecord
  belongs_to :interest

  validates :body, presence: true, length: { maximum: 500 }
end
