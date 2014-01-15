class Header < ActiveRecord::Base
  belongs_to :issue_list
  attr_accessible :key, :name, :issue_list_id
end
