class Apiv1.SelectionCountrySliceComponent extends Ember.Component
  tagName: "li"
  classNames: ["pointer", "selectable"]
  classNameBindings: ["isActive:active"]
  
  +computed locale, activeLocale
  isActive: ->
    (@locale and @activeLocale) and @locale is @activeLocale

  click: ->
    @sendAction 'action', @locale