class SaleFilesController < ApplicationController
  def index
    @sales_files = SaleFile.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @sale_file = SaleFile.find(params[:id])
  end

  def new
    @sale_file = SaleFile.new
  end

  def create
    @sale_file = SaleFile.new(sale_file_params)
    respond_to do |format|
      if @sale_file.save
        ParseFileWorker.perform_async(@sales_file)
        format.html { redirect_to @sale_file, notice: "Sales file was created." }
        format.json { render :show, status: :created, location: @import }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale_file.errors, status: :unprocessable_entity }
      end
    end
  end
end

private

def sale_file_params
  params.require(:sale_file).permit(:file)
end
