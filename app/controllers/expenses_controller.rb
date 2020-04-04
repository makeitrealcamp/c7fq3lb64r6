class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = Expense.where(user_id: current_user.id).order("date DESC")
    if params[:concept].present?
      @expenses = @expenses.where("concept = ? AND user_id = ?", params[:concept], current_user.id)
    end
    if params[:category_id].present?
      @expenses = @expenses.where("category_id = :category and user_id = :user", { category: params[:category_id], user: current_user.id } )
    end
  end

end
