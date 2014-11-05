class Apiv1.TreeTaxonLiComponent extends Ember.Component
  tagName: 'li'
  classNames: ['tree-taxon-li']
  classNameBindings: ['isSelected:selected', 'isExpanded:expanded']
  isExpanded: false
  isSelected: false
  adminMode: false

  +computed adminMode
  adminModeReasonable: ->
    @adminMode && @taxon.id

  toggleExpansion: ->
    if @isExpanded
      @unexpandMe()
    else
      @expandMe()

  toggleSelection: ->
    if @isSelected
      @unselectMe()
    else
      @selectMe()

  unexpandMe: ->
    @isExpanded = false

  expandMe: ->
    @isExpanded = true

  unselectMe: ->
    @activeTaxons ||= []
    @activeTaxons.removeObject @taxon
    @isSelected = false

  selectMe: ->
    @activeTaxons ||= []
    @activeTaxons.addObject @taxon
    @isSelected = true

  actions:
    killTaxon: ->
      @taxon.destroyRecord().then -> Apiv1.Flash.register "success", "taxon destroyed", 2000

    interactWithTaxon: ->
      if @taxon.hasChildren
        @toggleExpansion()
      else
        @toggleSelection()