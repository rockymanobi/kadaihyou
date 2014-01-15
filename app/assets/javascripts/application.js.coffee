#= require jquery
#= require jquery_ujs

#= require underscore/underscore
#= require backbone/backbone

#= require ./sample/app_init
#= require_tree ./sample

#= require issue_lists

App.generator.IssueListViewGenerator = ->
  App.view_instances.issueListView.remove() if App.view_instances.issueListView
  App.view_instances.issueListView = new App.IssueListView()
  $('#issue_list').append App.view_instances.issueListView.el

App.generator.newIssueViewGenerator = ->
  App.view_instances.newIssueView.remove() if App.view_instances.newIssueView
  App.view_instances.newIssueView = new App.NewIssueView()
  $('#new_issue').append App.view_instances.newIssueView.el


$ ->

  App.data.issue_headers_data = JSON.parse $('#issue_headers_data').val()
  App.data.issue_list_data = JSON.parse $('#issue_list_data').val()

  $(document)
    .on 'click' , '.new_issue_btn', ->
      App.generator.newIssueViewGenerator()

