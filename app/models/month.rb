class Month < ApplicationRecord
  has_many :payments
  has_many :expenses, through: :payments
  accepts_nested_attributes_for :payments

  validates :time, presence: true

  def self.with_active_expense_payments(*args)
    month = Month.new(*args)
    month.set_active_expense_payments
    month
  end

  def set_active_expense_payments
    Expense.where(active: true).each { |expense| create_payment expense }
  end

  def payments_attributes=(payments_attributes)
    super(payments_attributes)
    payments.each { |payment| payment.month = self }
  end

  private

  def create_payment(expense)
    payment = Payment.new month: self,
                          expense: expense
    payments.push payment
  end
end
