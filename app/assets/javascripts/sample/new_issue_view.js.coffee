#= require sample/new_issue_template
class App.NewIssueView extends Backbone.View

  initialize: ->
    @render()

  events: ->
    "click .register-btn": "onRegisterBtnClick"

  onRegisterBtnClick: (e)->

    issueData = {}

    issueData.issue_list_id = parseInt App.data.issue_list_data.id

    @$('.issue-data').each (idx, val)->
      $_element = $(val)
      issueData[$_element.attr('key')] = $_element.val()

    @register( issueData )




  register: (issueData)->

    $.post( '/issues.json' , { issue: issueData } )
    .done (data)=>
      App.mediator.trigger( 'new_issue_registered'  )
      @remove()
    .fail =>
      alert 'ng'

  render: ->

    console.log App.data.issue_headers_data
    @$el.html @template( { options: { headers: App.data.issue_headers_data }} )

  template: JST["sample/new_issue_template"]



