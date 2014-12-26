@Budgets = new Mongo.Collection('budgets')

if Meteor.server
  if (Budgets.find().count() == 0)
    for i in [1..10]
      Budgets.insert({ name: "Budget #{i}" })
