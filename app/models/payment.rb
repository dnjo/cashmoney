class Payment < ApplicationRecord
  belongs_to :month
  belongs_to :expense

  validates :month,
            :expense,
            :amount,
            presence: true
  validates :paid, inclusion: { in: [true, false] }
end
