class Apiv1.AdminTranslationsIndexController extends Ember.ObjectController
  locales: ["", "af", "sq", "ar", "be", "bg", "ca", "zh-CN", "zh-TW", "hr", "cs", "da", "nl", "en", "et", "tl", "fi", "fr", "gl", "de", "el", "iw", "hi", "hu", "is", "id", "ga", "it", "ja", "ko", "la", "lv", "lt", "mk", "ms", "mt", "no", "fa", "pl", "pt", "ro", "ru", "sr", "sk", "sl", "es", "sw", "sv", "th", "tr", "uk", "vi", "cy", "yi"]
  queryParams: ["page", "per", "locale", "query"]
  query: null
  page: 1
  per: 50
  locale: ''

  +computed model.translations
  translations: -> @model.translations

  +computed I18n.missingKeys.@each, I18n.locale
  missingTranslations: ->
    _.map I18n.missingKeys, (value, key) => 
      @store.createRecord "translation",
        key: key
        translatedText: value
        locale: I18n.locale