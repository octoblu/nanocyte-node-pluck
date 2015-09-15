{deepSet} = require 'lodash-deep'
class PluckNode
  constructor: (@config={}, @data={}) ->
  onMessage:(message, callback=->)=>

    newMessage = {}
    @config.key = 'msg' unless @config.key
    deepSet newMessage, @config.key, @config.value
    callback null, newMessage

module.exports = PluckNode
