class Commit.Collections.Steps extends Backbone.Collection

  model: Commit.Models.Step

  url: () ->
    "api/v1/goals/#{ this.goalId }/steps"

  parse: (data) ->
    this.goalId = data.goalId
    data.models

  comparator: (step) ->
    new Date(step.get 'date')

  lastDays: (n) ->
    lastDays = new Commit.Collections.Steps

    today = new Date
    startDate = new Date
    startDate.setDate(startDate.getDate() - n)

    while startDate <= today
      match = @find (step) ->
        step.matchingDate(startDate)

      if match
        lastDays.add match
      else
        lastDays.add new Commit.Models.Step(
          {date: startDate, work_done: 'none'},
          { parse: true }
        )

      startDate.setDate(startDate.getDate() + 1)

    lastDays

  stepForToday: ->
    @find (step) ->
      step.matchingDate(new Date)

  noStepForToday: ->
    !@stepForToday()
