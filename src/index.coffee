bindable = require "bindable"

class BindableCall extends bindable.Object
  
  ###
  ###

  constructor: (@_context, @_fn, @_args) ->
    super()

  ###
  ###

  load: () =>
    @set "loading", true
    @_fn.apply @, @_args.concat(@_onResult)

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

  args = Array.prototype.slice(2)

  if arguments.length is 1
    args.shift()
    fn = context
    context = @

  call = new BindableCall context, fn, args
  setTimeout call.load, 0
  call

