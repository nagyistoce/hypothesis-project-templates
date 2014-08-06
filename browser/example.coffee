# An example module that exports a single object using Browserify.
class ExampleModule
  write: (text) ->
    console.log(text)

module.exports = ExampleModule
