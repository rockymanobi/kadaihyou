class IssueList < ActiveRecord::Base
  attr_accessible :name
  has_many :headers

  def issues
    Issue.where( issue_list_id: self.id.to_s ).all
  end

  
end
