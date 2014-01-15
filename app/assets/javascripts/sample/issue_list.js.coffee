#= require sample/issue_list_template
#= require sample/issue_collection
#= require sample/issue_item_view
class App.IssueListView extends Backbone.View

  tagName: 'table'
  className: 'ISSUE-LIST'

  collection: new App.IssueCollection()

  initialize: ->
    @$el.attr('border','1')
    @issue_item_views = []
    @render()
    @fetchCollection()

    @listenTo App.mediator,'new_issue_registered', @onNewIssueRegistered
    @listenTo App.mediator,'issue_deleted', @onIssueDeleted
    @listenTo @collection,'reset', @onCollectionReset

  onIssueDeleted: (model)->
    @collection.remove( model )
    @clear_item_view()
    @render_item_view( issue ) for issue in @collection.models

  onCollectionReset: ->
    @clear_item_view()
    @render_item_view( issue ) for issue in @collection.models

  fetchCollection: ->
    @collection.fetch( { reset: true, data: { issue_list_id: App.data.issue_list_data.id } } )
    .fail ->
      alert 'err'

  onNewIssueRegistered: ->
    @fetchCollection()

  clear_item_view: ->
    @$('.list-data').children().remove()

  render_item_view: (data)->
    item_view = new App.IssueItemView( {model: data} )
    @issue_item_views.push item_view
    @$('.list-data').append( item_view.el )

  render: ->
    @$el.html @template( options: { headers: App.data.issue_headers_data } )

  template: JST['sample/issue_list_template']
