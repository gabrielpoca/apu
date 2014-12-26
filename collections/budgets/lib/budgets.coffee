@Budgets = new Mongo.Collection 'budgets',
  transform: (doc) ->
    doc.products = mapProductsTotal(doc.products)
    doc.products = sortProducts(doc.products)
    doc.budgetTotal = sumProductsTotal(doc.products)
    doc

_.extend Budgets,
  insertProduct: (selector, attrs) ->
    insertProduct(selector, attrs)
  removeProduct: (selector, attrs) ->
    removeProduct(selector, attrs)
  swapProducts: (selector, from, to) ->
    Meteor.call("swapProducts", selector, from, to)

insertProduct = (selector, attrs) ->
  products = Budgets.findOne(selector).products
  index = findMaxProductIndex(products)
  index++

  product = _.extend({ index: index }, attrs)
  if (!attrs['_id'])
    _.extend(product, { _id: randomId()  })

  Budgets.update(selector, { $push: { products: product }})

Meteor.methods
  swapProducts: (selector, from, to) ->
    products = Budgets.findOne(selector).products
    maxId = findMaxProductIndex(products)

    return false if to <= 0 || from <= 0
    return false if to > maxId || from > maxId

    toId = findProduct(products, { index: to })['_id']
    fromId = findProduct(products, { index: from })['_id']

    fromSelector = _.extend({}, selector, { "products._id": fromId })
    toSelector = _.extend({}, selector, { "products._id": toId })

    Budgets.update fromSelector, { $set: "products.$.index": to }
    Budgets.update toSelector, { $set: "products.$.index": from }

findProduct = (products, selector) ->
  _.findWhere(products, selector)

findMaxProductIndex = (products) ->
  _.reduce(products, ((memo, product) ->
      if memo > product.index
        memo
      else
        product.index
    ), 0)

removeProduct = (selector, attrs) ->
  Budgets.update selector,
    $pull:
      products: attrs

sumProductsTotal = (products) ->
  _.reduce products
    , (memo, product) ->
      memo + product.total
    , 0

mapProductsTotal = (products) ->
  _.map products, (product) ->
    product.total = productTotal(product)
    product

sortProducts = (products) ->
  _.sortBy products, (product) ->
    product.index

productTotal = (product) ->
  parseFloat((product.quantity * product.price).toFixed(2))

randomId = ->
  new Meteor.Collection.ObjectID().toHexString()
