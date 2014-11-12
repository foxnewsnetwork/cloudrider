class Apiv1.IndexRoute extends Ember.Route
  model: -> 
    products: @store.find("product", per: 3, order: "showcase")