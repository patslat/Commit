window.Commit =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (goaldata) ->
    $content = $('#content')
    goals = new Commit.Collections.Goals(goaldata)

    new Commit.Routers.Goals($content, goals)
