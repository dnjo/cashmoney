class Payment < ApplicationRecord
  belongs_to :month
  belongs_to :expense

  validates :month,
            :expense,
            :amount,
            presence: true
  validates :paid, inclusion: { in: [true, false] }
  after_initialize :set_default_values

  def expense=(expense)
    super
    self[:amount] ||= expense.amount
  end

  private

  def set_default_values
    return unless new_record?
    self[:paid] ||= false
  end
end
