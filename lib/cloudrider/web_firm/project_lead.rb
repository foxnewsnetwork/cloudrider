class Cloudrider::WebFirm::ProjectLead < Cloudrider::WebFirm::Slave

  def protofiles
    _constant_protofiles + _dynamic_protofiles
  end

  private
  def _engineer
    @engineer ||= Cloudrider::WebFirm::ScumbagEngineer.new(@protosite)
  end
  def _constant_protofiles
    _engineer.protofiles
  end

  def _dynamic_protofiles
    _always_needed_protofiles + _page_protofiles + _component_protofiles
  end

  def _always_needed_protofiles
    Cloudrider::WebFirm::SupportIntern.new(@protosite).protofiles
  end

  def _page_protofiles
    Cloudrider::WebFirm::PageDesigner.new(@protosite).protofiles
  end

  def _component_protofiles
    Cloudrider::WebFirm::ComponentArchitect.new(@protosite).protofiles
  end
end