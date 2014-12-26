if Meteor.startup && Meteor.userId()
  Meteor.subscribe 'budgets'
