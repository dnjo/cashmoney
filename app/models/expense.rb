class Expense < ApplicationRecord
  has_many :payments
  has_many :months, through: :payments

  validates :title,
            :amount,
            :start_month,
            :interval,
            :active,
            presence: true
end
