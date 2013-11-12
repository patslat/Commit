class Commit.Routers.Goals extends Backbone.Router
  initialize: ({@elements, @goals}) ->

  currentViews: {}
  elements: {}

  viewConstructors:
    index: Commit.Views.GoalsIndex

  routes:
    '': "index"

  index: ->
    @_renderView('index', { collection: @goals })

  _renderView: (type, options) ->
    newView = new @viewConstructors[type](options)
    @elements[type].html newView.render().$el
