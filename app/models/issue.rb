class Issue
  include Mongoid::Document

  def issue_list
    IssueList.find( self["issue_list_id"] )
  end
end
