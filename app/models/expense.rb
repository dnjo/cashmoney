class Expense < ApplicationRecord
  has_many :payments
  has_many :months, through: :payments
end
