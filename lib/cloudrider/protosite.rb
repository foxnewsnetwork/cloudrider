# protosite_example = {
#   pages: [protopage],
#   functions: someof KnownFunctionalities,
#   theme: oneof KnownThemes,
#   layout: oneof KnownLayouts
# }

# protopage_example = {
#   name: oneof KnownPages,
#   components: someof KnownComponents
# }

class Cloudrider::Protosite
  KnownPages = [:index, :products_index, :product_show, :about_us, :contact_us, :offers_new]
  KnownFunctionalities = [:admin_panel, :user_accounts, :public_offer, :categorizable_products]
  KnownThemes = [:craigslist, :material, :amateur, :girly, :flat]
  KnownLayouts = [
    "full-width, triple-column", # https://medium.com/@erikdkennedy/7-rules-for-creating-gorgeous-ui-part-1-559d4e805cda?hn=1 wikipedia redesign
    "full-width, double-column", # circa 2014 wikipedia
    "full-width, single-column", # full page sites (i.e. gamified sites)
    "mixed-width, hero-full", # like the tons of profile pages out there
    "mixed-width, hero-narrow", # bootstrap circa 2011
    "narrow-width" # circa 2007 yahoo
  ]

  def self.from_hash(hash)
    symbolized_hash = hash.symbolize_keys
    new.tap do |p|
      p.project_name = symbolized_hash[:project_name]
      p.domain_names = symbolized_hash[:domain_names]
      p.theme = symbolized_hash[:theme]
      p.layout = symbolized_hash[:layout]
      p.squash_api_key = symbolized_hash[:squash_api_key]
      p.functionalities = symbolized_hash[:functionalities]
      p.pages = symbolized_hash[:pages].to_a.map { |page_hash| Protopage.new page_hash.symbolize_keys }
    end
  end
  attr_accessor :pages, :functionalities, :theme, :project_name, :domain_names, :layout

  def public_offer?
    functionalities.include?("public_offer") && pages.any? { |page| page.name == "offers_new" }
  end

  def private_offer?
    !functionalities.include?("public_offer") && pages.any? { |page| page.name == "offers_new" }
  end

end

class Cloudrider::Protosite::Protopage
  attr_accessor :name, :components  
  KnownComponents = [
    "hero-splash",
    "cookie-splash",
    "introductory-lobby",
    "products-showcase",
    "table-booths",
    "products-catalog",
    "search-and-filter",
    "offers-overview"
  ]
  def initialize(name: name, components: components)
    @name, @components = name, components.to_a
  end
end

