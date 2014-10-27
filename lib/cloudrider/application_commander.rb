
class Cloudrider::ApplicationCommander
  include Thor::Base
  include Thor::Actions
  def initialize(params={})
    @params = params
  end

  def write_files
    _files_to_write.each do |file_order|
      create_file file_order.destination, file_order.contents
    end
  end

  private
  def _files_to_write
    _process_to_generate_file_orders.call @params
  end

  def _process_to_generate_file_orders
    _normalize_options >> _generate_file_orders
  end

  def _normalize_options
    -> (hash) { hash }
  end
  def _generate_file_orders
    -> (hash) { Cloudrider::FileOrdersMaker.new(hash).file_orders }
  end
end

