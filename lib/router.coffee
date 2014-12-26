validateLogin = ->
  if !Meteor.userId()
    @layout('SessionLayout')
    @render('SignIn')
  else
    @next()

findUserFromRequest = (request) ->
  if(request.cookies.meteor_login_token)
    account = Accounts._hashLoginToken(request.cookies.meteor_login_token)
    Meteor.users.findOne
      "services.resume.loginTokens.hashedToken": account
  else
    null

Router.configure
  layoutTemplate: 'DefaultLayout'

Router.onBeforeAction validateLogin,
  except: 'download'

Router.route '/',
  data: ->
    Budgets.find({}, { sort: { modifiedAt: -1 }})
  name: 'budget.index'

Router.route '/:_id',
  layoutTemplate: 'PrintLayout'
  name: 'budget.show'
  data: ->
    Budgets.findOne({ _id: @params._id })

Router.route '/:_id/edit',
  name: 'budget.edit'
  data: ->
    Budgets.findOne({ _id: @params._id })

Router.route ':_id/download',
  where: 'server'
  name: 'download'
  action: ->
    if findUserFromRequest(@request)
      budget = Budgets.findOne(@params._id)

      headers =
        'Content-type': 'application/pdf',
        'Content-Disposition': "attachment; filename=#{budget.name}.pdf"

      @response.writeHead(200, headers)

      wk = Meteor.npmRequire('wkhtmltopdf')
      html = SSR.render('PDF', budget)

      r = wk(html).pipe(@response)
