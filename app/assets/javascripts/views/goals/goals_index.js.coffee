class Commit.Views.GoalsIndex extends Backbone.View

  initialize: ({ @collection }) ->
    @listenTo(@collection, "add remove change", @render)

  className: "goals-index"

  children: []

  template: JST['goals/index']
  formTemplate: JST['goals/form']

  events:
    "click .new-commit-button": "_triggerForm"
    "click #submit-commit": "_handleForm"

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

  _triggerForm: ->
    if @$el.find('#new-commit-form-modal')[0]
      @$el.find('#new-commit-form-modal').modal()
    else
      @$el.append(@formTemplate())
      @$el.find('#new-commit-form-modal').modal()

  _handleForm: ->
    #grab data
    form = @$el.find('#new-commit-form')
    goalData = form.serializeJSON()
    form.find('input').val('')

    #kill modal
    @$el.find('#new-commit-form-modal').modal('hide')
    $('body').removeClass('modal-open')
    $('.modal-backdrop').remove()

    @collection.create(
      goalData,
      success: ->
        console.log "HOORAY IT WORKED"
      error: (data) ->
        console.log data['errors']
    )
