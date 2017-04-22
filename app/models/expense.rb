class Expense < ApplicationRecord
  has_many :payments
  has_many :months, through: :payments

  validates :title,
            :amount,
            :start_month,
            :interval,
            presence: true
  validates :active, inclusion: { in: [true, false] }
  after_initialize :set_default_values

  private

  def set_default_values
    return unless new_record?
    self[:start_month] ||= 0
    self[:interval] ||= 1
    self[:active] ||= true
  end
end
