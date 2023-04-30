class HomeController < ApplicationController
  def index
    @companies_sales = CompanySale.order("created_at DESC").page(params[:page]).per(10)
  end
end
