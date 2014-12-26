Budgets.before.insert (userId, doc) ->
  doc.createdAt = Date.now()
  doc.modifiedAt = Date.now()

Budgets.before.update (userId, doc, fieldNames, modifier, options) ->
  modifier.$set = modifier.$set || {}
  modifier.$set.modifiedAt = Date.now()
