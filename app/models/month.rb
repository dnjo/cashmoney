class Month < ApplicationRecord
  has_many :payments
  has_many :expenses, through: :payments

  validates :time, presence: true
  after_initialize :set_payments

  private

  def set_payments
    return unless new_record?
    each_active_payment { |expense| create_payment expense }
  end

  def each_active_payment
    Expense.where(active: true).each do |expense|
      yield expense
    end
  end

  def create_payment(expense)
    payment = Payment.new month: self,
                          expense: expense
    payments.push payment
  end
end
