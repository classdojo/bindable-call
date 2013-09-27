bindable = require "bindable"

class BindableCall extends bindable.Object
  
  ###
  ###

  constructor: (context, @_fn) ->
    super context

  ###
  ###

  load: () =>
    @set "loading", true
    @_fn.call @, @_onResult

  ###
  ###

  _onResult: (err, data) =>
    @set "loading", false
    @set "error", err
    @set "success", !err
    @set "data", data
    @set "result", data

    @set "response", {
      error: err,
      data: data
    }


module.exports = (context = {}, fn) ->

  if arguments.length is 1
    fn = context
    context = {}

  call = new BindableCall context, fn
  call.load()
  call

