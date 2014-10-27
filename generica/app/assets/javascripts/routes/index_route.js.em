class Apiv1.IndexRoute extends Ember.Route
  model: -> 
    products: @store.find("product", per: 3)
    employees: @store.find("employee", per: 5)