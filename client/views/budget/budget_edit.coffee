Template.BudgetEdit.events
  'keyup #name': (e) ->
    Budgets.update({ _id: @_id }, $set: { name: e.target.value })
