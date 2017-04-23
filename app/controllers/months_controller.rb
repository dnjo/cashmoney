class MonthsController < ApplicationController
  def show
    @month = saved_month || month_with_payments
    render
  end

  def update
    @month = saved_month || new_month
    @month.payments_attributes = payments_attributes
    @month.save!
    render :show
  end

  private

  def saved_month
    Month.find_by time: date_from_params
  end

  def new_month
    Month.new time: date_from_params
  end

  def month_with_payments
    Month.with_active_expense_payments time: date_from_params
  end

  def date_from_params
    @date ||= Date.new params[:year].to_i, params[:month_num].to_i
  end

  def payments_attributes
    return {} unless params[:month]
    month_params = params[:month].permit permitted_month_params
    month_params[:payments_attributes]
  end

  def permitted_month_params
    { payments_attributes: %i[id expense_id amount paid _destroy] }
  end
end
