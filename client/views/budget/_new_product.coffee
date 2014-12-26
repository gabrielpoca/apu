Template.NewProduct.created = ->
  @description = new ReactiveVar
  @price = new ReactiveVar
  @quantity = new ReactiveVar

Template.NewProduct.helpers
  total: ->
    template = Template.instance()
    price = template.price.get()
    quantity = template.quantity.get()

    if _.isNumber(price) && _.isNumber(quantity)
      (price * quantity).toFixed(2)
    else
      0

Template.NewProduct.events
  'change #new_description': (e, template) ->
    template.description.set(e.target.value)

  'change #new_price': (e, template) ->
    template.price.set(parseFloat(e.target.value))

  'change #new_quantity': (e, template) ->
    template.quantity.set(parseInt(e.target.value))

  'click #new_submit': (e, template) ->
    description = template.description
    price = template.price
    quantity = template.quantity
    
    Budgets.update { _id: @_id },
      $push:
        products:
          _id: new Meteor.Collection.ObjectID().toHexString()
          description: description.get()
          price: price.get()
          quantity: quantity.get()

    for property in [description, price, quantity]
      property.set('')
