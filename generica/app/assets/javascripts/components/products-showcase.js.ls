Apiv1.ProductsShowcaseComponent = Ember.Component.extend do
  classNames: ["products-showcase"]

  productsCount: Ember.computed "products.content.meta.count", ->
    @get "products.content.meta.count"
