class Apiv1.ProductsIndexController extends Ember.ObjectController
  queryParams: ["per", "page", "query", "ati"]
  per: 15
  page: 1
  query: ""
  ati: ""
  
  +computed model.activeTaxons.@each
  activeTaxons: -> @model.activeTaxons

  +observer activeTaxons.@each.id
  manageATI: ->
    return if Ember.isBlank @activeTaxons
    qp = _.extend { query: @query }, @searchParams
    @transitionToRoute "products.index", queryParams: qp

  +computed Apiv1.PreloadedTaxons.@each.parentId
  taxons: -> Apiv1.PreloadedTaxons.rejectBy "parentId"

  +computed products.content.meta
  metadatum: -> @get("products.content.meta")

  +computed model.products
  products: -> @model.products

  +computed page, per, activeTaxons.@each.id
  searchParams: ->
    page: @page
    per: @per
    ati: @activeTaxons.mapBy("id")

  actions:
    search: (opts)->
      qp = _.extend { query: opts.searchQuery }, @searchParams
      @transitionToRoute "products.index", queryParams: qp