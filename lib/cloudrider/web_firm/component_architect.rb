class Cloudrider::WebFirm::ComponentArchitect < Cloudrider::WebFirm::Slave
  def protofiles
    _component_protofiles + _standardized_component_protofiles
  end

  private
  def _component_names
    @protosite.pages.map(&:components).flatten.uniq
  end
  def _component_protofiles
    _component_names.map do |name|
      _v name: name, protosite: @protosite
    end.flatten
  end
  def _standardized_component_protofiles
    ["site-nav", "site-footer"].map do |name|
      _v name: name, protosite: @protosite
    end.flatten
  end
  def _v(opts={})
    Cloudrider::ApplicationCommander.varisset_protofiles_for opts
  end
end