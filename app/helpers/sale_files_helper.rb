module SaleFilesHelper
  def total_sales(sale_file)
    sale_file.company_sales.sum(:item_price)
  end
end
