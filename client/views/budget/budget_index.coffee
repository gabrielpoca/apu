Template.BudgetIndex.events
  'click .delete': ->
    Budgets.remove({ _id: @_id })

  'click #new': ->
    budget = Budgets.insert({ name: 'Novo Orçamento' })
