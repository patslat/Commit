class Commit.Views.GoalShow extends Backbone.View

  className: "goal-show-container panel"

  attributes: ->
    "id": "goal-#{ @model.get '_id' }"

  children: []

  template: JST['goals/show']

  events:
    "click .make-commit": "_makeCommit"
    "click .delete-commit": "_deleteCommit"

  render: ->
    @_leaveChildren()
    @$el.html @template(goal: @model)

    @_renderDailyGoal()
    @_addDeleteButton()
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

  _addDeleteButton: ->
    $dailyGoal = @$el.find '.daily-goal'
    $dailyGoal.append(
      "<button class='delete-commit btn btn-sm btn-danger'>Give Up</button>"
    )

  _addCommitButtons: ->
    $levelDivs = @$el.find '.daily-goal-item'
    for levelDiv in $levelDivs
      $levelDiv = $(levelDiv)
      level = $levelDiv.data('level')
      $levelDiv.append(
        "<button class='make-commit btn btn-sm #{level}'>Commit</button>"
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

  _deleteCommit: ->
    @model.destroy( wait: true ) if confirm "Are you sure you want to give up?"
