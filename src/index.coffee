bindable = require "bindable"

class BindableRequest extends bindable.Object
  
  ###
  ###

  constructor: (context, @_fn) ->
    super context

  ###
  ###

  load: () ->
    @set "loading", true
    @_fn.call @, @_onResult

  ###
  ###

  _onResult: (err, data) =>
    @set "loading", false
    @set "error", err

    if not error or data?
      @set "data", data ? true

    @set "response", {
      error: err,
      data: data
    }


module.exports = (context = {}, fn = () ->) ->

  if arguments.length is 1
    context = fn

  return new BindableRequest(fn).load()

