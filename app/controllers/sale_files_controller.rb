class SaleFilesController < ApplicationController
  def index
    @sales_files = SaleFile.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    # debugger
    @sale_file = SaleFile.find(params[:id])
    @total_sales = 0 
    @total_sales = @sale_file.company_sales.collect{|value| @total_sales + value.item_price}.inject(0, :+)

    @sale_file
  end

  def new
    @sale_file = SaleFile.new
  end

  def create
    @sale_file = SaleFile.new(sale_file_params)
    if @sale_file.save
      ParseFileWorker.perform_async(@sale_file.id)
      redirect_to @sale_file, notice: "Sales file was created."
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private

def sale_file_params
  params.require(:sale_file).permit(:file)
end
