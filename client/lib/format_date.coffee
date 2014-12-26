DateFormats =
  short: "DD MMMM - YYYY"
  long: "DD.MM.YYYY HH:mm"

UI.registerHelper "formatDate", (datetime, format) ->
  if (moment)
    f = DateFormats[format]
    moment(datetime).format(f)
  else
    return datetime
