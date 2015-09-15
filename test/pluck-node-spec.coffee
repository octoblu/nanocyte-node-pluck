PluckNode = require '../src/pluck-node'
describe 'Pluck Node', ->
  it 'should exist', ->
    expect(PluckNode).to.exist

  describe 'when constructed', ->
    beforeEach ->
      @sut = new PluckNode

    it 'should exist', ->
      expect(@sut).to.exist

    it 'should have an onMessage function', ->
      expect(@sut.onMessage).to.exist

  describe '->onMessage', ->
    describe 'when plucking a value', ->
      beforeEach ->
        @config = {
          value: 10
          key: 'number'
        }
        @data = {}
        @callback = sinon.spy()
        @message = {
          hi: 'whatsup'
        }
        @newMessage = {
          number: 10
        }
        @sut = new PluckNode(@config, @data)
        @sut.onMessage(@message, @callback)
      it 'should store the value in key', ->
        expect(@callback).to.have.been.calledWith(null, @newMessage)

  describe 'when plucking a value with no key', ->
    beforeEach ->
      @config = {
        value: 10
      }
      @data = {}
      @callback = sinon.spy()
      @message = {
        hi: 'whatsup'
      }
      @newMessage = {
        msg: 10
      }
      @sut = new PluckNode(@config, @data)
      @sut.onMessage(@message, @callback)
    it 'should store the value in key', ->
      expect(@callback).to.have.been.calledWith(null, @newMessage)
  describe 'when plucking an object value with no key', ->
    beforeEach ->
      @config = {
        value: {
          hi: 'potato'
        }
      }
      @data = {}
      @callback = sinon.spy()
      @message = {
        hi: 'whatsup'
      }
      @newMessage = {
        msg: {
          hi: 'potato'
        }
      }
      @sut = new PluckNode(@config, @data)
      @sut.onMessage(@message, @callback)
    it 'should store the value in key', ->
      expect(@callback).to.have.been.calledWith(null, @newMessage)
