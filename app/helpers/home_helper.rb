module HomeHelper
  def total_sale_all_time 
    CompanySale.sum(:item_price)
  end
end
