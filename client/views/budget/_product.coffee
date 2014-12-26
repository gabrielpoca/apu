Template.Product.events
  'click .delete': (e) ->
    Budgets.removeProduct { _id: @parent._id }, { _id: @data._id }
  'click .up': (e) ->
    Budgets.swapProducts { _id: @parent._id }, @data.index, @data.index - 1
  'click .down': (e) ->
    Budgets.swapProducts { _id: @parent._id }, @data.index, @data.index + 1
