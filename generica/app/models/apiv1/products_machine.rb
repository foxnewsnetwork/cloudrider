class Apiv1::ProductsMachine
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def products
    @products = _filter_pipeline.call Apiv1::Product
  end
  private
  def _filter_pipeline
    _process_taxons >> _process_ordering >> _process_page >> _process_per_page
  end
  def _process_page
    -> (product) { product.page _page }
  end
  def _process_per_page
    -> (product) { product.per _per_page }
  end
  def _process_ordering
    -> (product) { product.order_by_created_at }
  end
  def _process_taxons
    -> (product) { _taxon_ids.present? ? product.involving_taxon_ids(_taxon_ids) : product }
  end
  def _taxon_ids
    params[:taxons]
  end
  def _page
    params[:page] || 0
  end
  def _per_page
    params[:per] || 10
  end
end