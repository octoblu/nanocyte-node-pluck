PluckNode = require '../src/pluck-node'
describe 'OctoModel', ->
  it 'should exist', ->
    expect(PluckNode).to.exist

  describe 'when constructed', ->
    beforeEach ->
      @sut = new PluckNode

    it 'should exist', ->
      expect(@sut).to.exist

    it 'should have an onMessage function', ->
      expect(@sut.onMessage).to.exist
