class Commit.Collections.Steps extends Backbone.Collection

  model: Commit.Models.Step

  comparator: (step) ->
    new Date(step.get 'date')

  lastDays: (n) ->
    today = new Date
    startDate = new Date
    startDate.setDate(startDate.getDate() - n)

    while startDate <= today
      unless @findWhere(date: startDate)
        @add new Commit.Models.Step(date: startDate.toString(), work_done: 'none')
      startDate.setDate(startDate.getDate() + 1)
