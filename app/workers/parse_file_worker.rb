class ParseFileWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0
  sidekiq_options queue: :sale_file

  def perform(sale_file_id)
    sale_file = SaleFile.find(sale_file_id)
    ParseFileService.new(sale_file).call
  end
end
