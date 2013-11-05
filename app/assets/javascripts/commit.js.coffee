window.Commit =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert 'Hello from Backbone!'

$(document).ready ->
  Commit.initialize()
