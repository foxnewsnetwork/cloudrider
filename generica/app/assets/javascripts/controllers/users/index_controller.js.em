class Apiv1.UsersIndexController extends Ember.ObjectController
  +computed Apiv1.CurrentUserSession
  user: -> get$(Apiv1, "CurrentUserSession")