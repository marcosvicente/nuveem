class ParseFileWorker
  include Sidekiq::Worker

  def perform(sale_file)
    ParseFileService.new(sale_file).call
  end
end
