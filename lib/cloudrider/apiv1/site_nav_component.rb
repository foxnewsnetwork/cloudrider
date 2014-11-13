class Cloudrider::Apiv1::SiteNavComponent < Cloudrider::Apiv1::Base
  private
  def _context
    Context.new.tap do |c|
      c.nav_style = (@style || :material).to_sym
    end
  end
end

class Cloudrider::Apiv1::SiteNavComponent::Context
  attr_accessor :nav_style
  def my_company_name
    "Cloudrider"
  end

  def about_link
    if pages?
      '"about"'
    else
      '"index" (query-params anchor="about")'
    end
  end

  def products_link
    if pages?
      '"products.index"'
    else
      '"index" (query-params anchor="products")'
    end
  end

  def contacts_link
    if pages?
      '"contacts"'
    else
      '"index" (query-params anchor="contacts")'
    end
  end

  def pages?
    true
  end
end