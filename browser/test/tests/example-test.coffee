sinon = require('sinon')
ExampleModule = require('../../example')

describe 'ExampleModule', ->
  sandbox = sinon.sandbox.create()

  afterEach -> sandbox.restore()

  describe 'write', ->
    exampleModule = null

    beforeEach ->
      exampleModule = new ExampleModule()

    it 'logs to the console', ->
      sandbox.stub(console, 'log')

      exampleModule.write('foo')
      sinon.assert.calledWith(console.log, 'foo')
