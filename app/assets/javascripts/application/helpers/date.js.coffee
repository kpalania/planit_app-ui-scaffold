define [], () ->
  Date::addDays = (days) ->
    dat = new Date(@valueOf())
    dat.setDate dat.getDate() + days
    dat