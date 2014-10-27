class Apiv1.TreeTaxonWrapperComponent extends Ember.Component
  classNames: ['tree-taxon-wrapper']
  activeTaxons: []

  +computed taxonGroups.length
  rootGenuses: ->
    return [] unless @taxonGroups
    _.map @taxonGroups, (taxons, rootGenus) ->
      Ember.Object.create
        taxonName: rootGenus
        children: taxons
        hasChildren: taxons.length > 0

  +computed taxons.@each.rootGenus
  taxonGroups: ->
    @taxons.reduce @_groupReducer, {}

  _groupReducer: (groups, taxon) ->
    return groups if taxon.get "parentId"
    groups[taxon.get "rootGenus"] ||= []
    groups[taxon.get "rootGenus"].push taxon
    groups