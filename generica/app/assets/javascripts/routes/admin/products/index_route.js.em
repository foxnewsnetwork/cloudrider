class Apiv1.AdminProductsIndexRoute extends Ember.Route
  model: ->
    @store.find "product", limit: 100