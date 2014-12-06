#= require_self
#= require generica/image-preload
#= require ./packages/flash
#= require ./packages/image_preloader
#= require ./packages/tag_parser
#= require_tree ./mixins
#= require_tree ./helpers
#= require_tree ./controllers
#= require_tree ./templates
#= require_tree ./routes
#= require_tree ./adapters
#= require_tree ./models
#= require_tree ./transforms
#= require_tree ./views
#= require_tree ./components
#= require_tree ./config


window.Apiv1 = Ember.Application.create do
  rootElement: 'body#apiv1'

Apiv1.ApplicationStore = DS.Store.extend do
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  adapter: DS.ActiveModelAdapter
  
$ _.once -> 
  if window.RawCurrentUserSession
    store = Apiv1.__container__.lookup("store:main")
    set$ Apiv1, "CurrentUserSession", store.push "adminSession", window.RawCurrentUserSession
  $('#now-loading').hide "puff", 600