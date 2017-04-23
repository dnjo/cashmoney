class ExpensesController < ApplicationController
  before_action :setup_expenses, only: %i[index create]
  before_action :setup_new_expense, only: :index
  before_action :setup_start_month_options, only: %i[index create edit update]
  before_action :setup_existing_expense, only: %i[edit update destroy]

  def create
    @expense = Expense.new expense_params
    @expense.save if @expense.valid?
    render :index
  end

  def update
    @expense.update_attributes expense_params
    render :edit
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path
  end

  private

  def setup_start_month_options
    @start_month_options = (0...12).map do |i|
      [Date::MONTHNAMES[i + 1], i]
    end
  end

  def setup_existing_expense
    @expense = Expense.find params[:id]
  end

  def setup_new_expense
    @expense = Expense.new
  end

  def setup_expenses
    @expenses = Expense.all
  end

  def expense_params
    params.require(:expense).permit :title,
                                    :description,
                                    :amount,
                                    :start_month,
                                    :interval,
                                    :active
  end
end
