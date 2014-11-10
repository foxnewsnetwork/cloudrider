class Apiv1.PreloadBillboardComponent extends Ember.Component
  classNames: ["preload-billboard"]

  +computed Apiv1.ImagePreloader.instance.isLoading
  stillLoading: -> Apiv1.ImagePreloader.instance.get "isLoading"

  +computed Apiv1.ImagePreloader.instance.isLoading
  finishedLoading: -> not Apiv1.ImagePreloader.instance.get "isLoading"

  +observer Apiv1.ImagePreloader.instance.isLoading
  manageWhichToHide: ->
    if @stillLoading
      $("#billboard-holder").show()
      $("#everything-else-holder").hide()
    if @finishedLoading
      $("#everything-else-holder").show()
      $("#billboard-holder").hide "puff", 750

  didInsertElement: ->
    @manageWhichToHide()