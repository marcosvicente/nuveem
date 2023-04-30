class ParseFileService
  def initialize(sale_file)
    @sale_file = sale_file
  end

  def call
    change_status(:processing)
    output = File.read(@sale_file.file.path)
    line = get_line(output)
    get_column(line)

    change_status(:done)
  end


  private

  def get_line(output)
    output.split("\n")
  end

  def get_column(output)
    output.each_with_index do |column, index|
      next if index == 0

      save_company_sale(column)
    end
  end

  def save_company_sale(params)
    params = params.split("\t")
    company_sale = CompanySale.new(
      purchaser_name: sanitaze_string(params[0]),
      item_description: sanitaze_string(params[1]),
      item_price: params[2],
      purchase_count: params[3],
      merchant_address: sanitaze_string(params[4]),
      merchant_name: sanitaze_string(params[5]),
      sale_file_id: @sale_file.id
    )
    company_sale.save!
  end

  def sanitaze_string(str)
    str.delete! '"'
  end

  def change_status( kind)
    @sale_file.status = kind
    @sale_file.save!
  end
end