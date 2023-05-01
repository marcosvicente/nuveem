class HomeController < ApplicationController
  def index
    @companies_sales = CompanySale.order("created_at DESC").page(params[:page]).per(10)
    @total_sale_all_time = 0
    @total_sale_all_time =  @companies_sales.collect{|value| @total_sale_all_time + value.item_price}.inject(0, :+)
  end
end
