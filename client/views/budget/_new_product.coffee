validNumber = (value) ->
  _.isNumber(value) && !_.isNaN(value)

Template.NewProduct.created = ->
  @description = new ReactiveVar
  @price = new ReactiveVar
  @quantity = new ReactiveVar

Template.NewProduct.helpers
  total: ->
    template = Template.instance()
    price = template.price.get()
    quantity = template.quantity.get()

    if validNumber(price) && validNumber(quantity)
      (price * quantity).toFixed(2)
    else
      0

Template.NewProduct.events
  'change #new_description, keyup #new_description': (e, template) ->
    template.description.set(e.target.value)

  'change #new_price, keyup #new_price': (e, template) ->
    template.price.set(parseFloat(e.target.value))

  'change #new_quantity, keyup #new_quantity': (e, template) ->
    template.quantity.set(parseInt(e.target.value))

  'click #new_submit': (e, template) ->
    description = template.description.get()
    price = template.price.get()
    quantity = template.quantity.get()

    Budgets.insertProduct { _id: @_id },
      description: description
      price: price
      quantity: quantity

    template.description.set('')
    template.price.set('')
    template.quantity.set('')
    $('#new_price, #new_description, #new_quantity').val('')
