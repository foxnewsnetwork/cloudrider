class Cloudrider::Apiv1::TableBoothsComponent < Cloudrider::Apiv1::Base
  class Context
    def booth_style
      :contact_form
    end
    def main_contact_email 
      "terricapo@gmail.com"
    end
    def contact_us_call_to_action
      "are you a wholesale buyer?"
    end
  end
  private
  def _context
    Context.new
  end
end