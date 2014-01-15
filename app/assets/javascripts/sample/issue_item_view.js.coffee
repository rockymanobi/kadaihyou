#=require sample/col_item_view
class App.IssueItemView extends Backbone.View

  tagName: 'tr'

  initialize: (options)->
    @render()
    @listenTo @model, 'destroy', @onModelDestroy

  events: ->
    "click .delete-btn" : "onDeleteBtnClicke"

  onModelDestroy: ->
    App.mediator.trigger 'issue_deleted', @model

  onDeleteBtnClicke: (e)->
    ans = confirm 'are you sure?'
    return if !ans
    @destroy()

  destroy: ->
    @model.destroy()

  render: ()->

    @appendColumnItem( header.key ) for header in App.data.issue_headers_data
    @$el.append('<td><input class="delete-btn" type="button" value="delete"></td>')
    
  appendColumnItem: (key)->
    @$el.append( new App.ColItemView( { model: @model, key: key } ).el )

    
