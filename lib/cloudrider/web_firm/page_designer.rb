class Cloudrider::WebFirm::PageDesigner < Cloudrider::WebFirm::Slave

  def protofiles
    _page_names.map do |name|
      Cloudrider::ApplicationCommander.varisset_protofiles_for name: name, protosite: @protosite
    end.flatten
  end

  private
  def _page_names
    @protosite.pages.map(&:name)
  end
end