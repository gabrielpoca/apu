Meteor.publish 'budgets', ->
  if @userId
    Budgets.find()
