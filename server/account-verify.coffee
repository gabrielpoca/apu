Accounts.validateLoginAttempt (info) ->
  canAccess(info.user)
 
canAccess = (user) ->
  return false if !user
  verifyEmail(user.services['google'].email)
 
verifyEmail = (email) ->
  email == 'cette118@gmail.com' || email == 'domingos@hortogirassol.pt'
