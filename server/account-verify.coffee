Accounts.validateLoginAttempt (info) ->
  canAccess(info.user)
 
canAccess = (user) ->
  return false if !user
  verifyEmail(user.services['google'].email)
 
verifyEmail = (email) ->
  _.contains(Meteor.settings.allowed_emails, email)
