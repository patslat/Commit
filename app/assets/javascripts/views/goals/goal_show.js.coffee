class Commit.Views.GoalShow extends Backbone.View

  className: "goal-show panel"

  attributes: ->
    "id": "goal-#{ @model.get '_id' }"

  children: []

  template: JST['goals/show']

  events:
    "click .make-commit": "_makeCommit"

  render: ->
    @_leaveChildren()
    @$el.html @template(goal: @model)

    @_renderDailyGoal()
    @_addCommitButtons() if @model.steps().noStepForToday()
    @_renderSteps()
    this

  remove: ->
    super()

  _leaveChildren: ->
    child.remove() for child in @children

  _renderSteps: ->
    stepsView = new Commit.Views.StepsIndex(collection: @model.steps(), parent: this)
    @children << stepsView
    @$el.find('.goal-body').append stepsView.render().$el

  _renderDailyGoal: ->
    dailyGoalView = new Commit.Views.DailyGoalShow(model: @model.dailyGoal())
    @children << dailyGoalView
    @$el.find('.goal-body').append dailyGoalView.render().$el

  _addCommitButtons: ->
    $levelDiv = @$el.find '.daily-goal-item'
    $levelDiv.append(
      "<button class='make-commit btn btn-sm'>Commit</button>"
    )

  _removeCommitButtons: ->
    @$el.find('.make-commit').remove()

  _makeCommit: (event) ->
    work_done = $(event.target).parent().data('level')
    @model.steps().create(
      {
        work_done: work_done,
        date: new Date
      },
      {
        success: (step) =>
          # not sure why this is not automatically added
          @model.steps().add(step)
          @_removeCommitButtons()
        wait: true
      }
    )
