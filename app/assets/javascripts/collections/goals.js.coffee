class Commit.Collections.Goals extends Backbone.Collection

  model: Commit.Models.Goal

  parse: (data) ->
    data
