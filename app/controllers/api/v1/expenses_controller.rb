module Api
  module V1
    class ExpensesController < ApplicationController
      def index
        @categories = Expense.pluck(:category).uniq
        @aggregated_expenses = Expense.get_aggregated_summary
        @result_json = {}
        @categories.each do |cat|
          @result_json[cat] = {}
        end
        @aggregated_expenses.each do |ar|
          @result_json[ar[0]][make_object(ar)] = ar[3].round(2)
        end
        render json: @result_json
      end

      private

      def make_object(ar = [])
        week_start = DateTime.parse(ar[1]).strftime("%b%d")
        week_end = DateTime.parse(ar[2]).strftime("%b%d")
        key = "#{week_start}-#{week_end}"
        key
      end
    end
  end
end