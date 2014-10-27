class Apiv1.ProductsIndexController extends Ember.ObjectController

  +computed model.taxons.@each.parentId
  taxons: -> @get("model.taxons")

  +computed activeTaxons.@each, searchQuery
  products: -> @store.find "product", taxons: @activeTaxonIds, query: @searchQuery, limit: 100

  +computed searchParams.searchQuery
  searchQuery: -> @get "searchParams.searchQuery"

  +computed searchParams.activeTaxons.@each.id
  activeTaxonIds: ->
    _.map @get("searchParams.activeTaxons"), (t) -> t.get "id"

  actions:
    search: (opts) ->
      @searchParams = opts
