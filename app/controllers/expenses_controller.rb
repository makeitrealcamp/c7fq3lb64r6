class ExpensesController < ApplicationController

  def index
    if params[:concept].blank? and params[:category_id].blank?
      @expenses = Expense.order("date DESC")
      render :index
    elsif params[:category_id].blank?
      @expenses = Expense.where(concept: castparam(params[:concept]))
      render :index
    elsif params[:concept].blank?
      @expenses = Expense.where(category_id: params[:category_id])
      render :index
    else
      @expenses = Expense.where(category_id: params[:category_id], concept: castparam(params[:concept]))
      render :index
    end
    @expenses = Expense.order("date DESC")
  end

  private 
  def castparam(string)
    string = string.downcase
    
    case string
    when "burral"
      string = "Hamburguesas el burral"
    when "gasolina"
      string = string.capitalize
    when "lamparas"
      string = string.capitalize
    else
      string
    end
  end

end
