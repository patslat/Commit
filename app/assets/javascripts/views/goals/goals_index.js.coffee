class Commit.Views.GoalsIndex extends Backbone.View

  className: "goals-index"

  children: []

  template: JST['goals/index']
  formTemplate: JST['goals/form']

  events:
    "click .new-commit-button": "triggerForm"

  render: ->
    @$el.html(@template())
    @collection.each (goal) =>
      show = new Commit.Views.GoalShow({model: goal})
      @children << show
      @$el.append(show.render().$el)
    this

  remove: ->
    child.remove() for child in children
    super()

  triggerForm: ->
    if @$el.find('#new-commit-form')[0]
      @$el.find('#new-commit-form').modal()
    else
      @$el.append(@formTemplate())
      @$el.find('#new-commit-form').modal()
