class Month < ApplicationRecord
  has_many :payments
  has_many :expenses, through: :payments
  accepts_nested_attributes_for :payments, allow_destroy: true

  validates :time, presence: true

  def self.with_active_expense_payments(*args)
    month = Month.new(*args)
    month.set_active_expense_payments
    month
  end

  def set_active_expense_payments
    active_expenses = Expense.where active: true
    month_expenses = filter_month_expenses active_expenses
    month_expenses.each { |expense| create_payment expense }
  end

  def payments_attributes=(payments_attributes)
    super(payments_attributes)
    payments.each { |payment| payment.month = self }
  end

  def add_payment(expense_id)
    return if expenses.find_by id: expense_id
    expense = Expense.find expense_id
    create_payment expense
  end

  private

  def create_payment(expense)
    payment = Payment.new month: self,
                          expense: expense
    payments.push payment
  end

  def filter_month_expenses(expenses)
    expenses.select do |expense|
      month_difference = time.month - (expense.start_month + 1)
      (month_difference % expense.interval).zero?
    end
  end
end
