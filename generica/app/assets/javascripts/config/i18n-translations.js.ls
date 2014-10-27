$.get "apiv1/i18n_translations.js", (data) ->
  Ember.set window.I18n, "translations", data.translations
  Ember.set window.I18n, "locale", data.locale