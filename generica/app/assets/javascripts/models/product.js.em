class Apiv1.Product extends DS.Model
  sku: DS.attr "string"
  material: DS.attr "string"
  price: DS.attr "string"
  amount: DS.attr "string"
  place: DS.attr "string"
  quality: DS.attr "string"
  others: DS.attr "string"

  attachments: DS.hasMany "attachment", async: true
  pictures: DS.hasMany "picture", async: true
  taxons: DS.hasMany "taxon", async: true

  +computed material, price, amount, place, sku
  roughSummary: ->
    "#{@price || 'no price'} #{@material || 'unknown material'} #{@amount || 'unknown quantity'} @ #{@place || 'unknown place'} - #{@sku || 'no sku'}"