class Month < ApplicationRecord
  has_many :payments
  has_many :expenses, through: :payments

  validates :time, presence: true
end
