Template.Product.helpers
  total: ->
    (@price * @quantity).toFixed(2)
