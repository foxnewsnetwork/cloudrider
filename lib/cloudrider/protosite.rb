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
  KnownPages = [:index, :products_index, :product_show, :about_us, :contact_us]
  KnownFunctionalities = [:admin_panel, :user_accounts, :offerable_products, :categorizable_products]
  KnownThemes = [:craigslist, :material, :amateur, :girly, :flat]
  KnownLayouts = [
    "full-width, triple-column", # https://medium.com/@erikdkennedy/7-rules-for-creating-gorgeous-ui-part-1-559d4e805cda?hn=1 wikipedia redesign
    "full-width, double-column", # circa 2014 wikipedia
    "full-width, single-column", # full page sites (i.e. gamified sites)
    "mixed-width, hero-full", # like the tons of profile pages out there
    "mixed-width, hero-narrow", # bootstrap circa 2011
    "narrow-width" # circa 2007 yahoo
  ]
end

class Cloudrider::Protosite::Protopage
  attr_accessor :name, :components  
  KnownComponents = ["hero-splash", "cookie-splash", "introductory-lobby", "products-showcase", "table-booths", "products-catalog"]
end