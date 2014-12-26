Meteor.subscribe 'budgets'

Router.configure
  layoutTemplate: 'Layout'

Router.route '/',
  name: 'budget.index'

Router.route '/:_id',
  name: 'budget.show'
  data: ->
    a = Budgets.findOne({ _id: @params._id })
