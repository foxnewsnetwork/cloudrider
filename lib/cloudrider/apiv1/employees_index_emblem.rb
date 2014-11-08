class Cloudrider::Apiv1::EmployeeesIndexEmblem < Cloudrider::Apiv1::Base
  class Context
    def index_style
      :top
    end
  end

  private
  def _context
    Context.new
  end
end