class Commit.Models.Step extends Backbone.Model

  parse: (data) ->
    date = data.date
    delete data.date
    data.date = new Date(date)
    data

  matchingDate: (matchDate) ->
    date = @get 'date'
    return (
      date.getDate() == matchDate.getDate() &&
      date.getMonth() == matchDate.getMonth() &&
      date.getYear() == matchDate.getYear()
    )

  formattedDate: ->
    date = @get('date')
    #$.formatDateTime('mm/dd/y g:ii a', date)
