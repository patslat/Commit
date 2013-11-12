window.Commit =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (goaldata) ->
    $content = $('#content')
    goals = new Commit.Collections.Goals(goaldata, { parse: true })
    router = new Commit.Routers.Goals(
      elements: { index: $content },
      goals: goals
    )
    Backbone.history.start()
