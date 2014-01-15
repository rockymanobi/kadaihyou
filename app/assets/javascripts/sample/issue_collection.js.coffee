#= require sample/issue_model
class App.IssueCollection extends Backbone.Collection

  url: "/issues"
  model: App.IssueModel

