
class IssuesController < ApplicationController

  def index
    @issues = Issue.where( issue_list_id: params[:issue_list_id].to_s )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issues, root: false }
    end
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(params[:issue])

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @issue = Issue.find(params[:id])

    attrs = {}
    @issue.issue_list.headers.map do |h| 
      attrs[h.key] = params[h.key]
    end

    respond_to do |format|
      if @issue.update_attributes attrs
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { head :no_content, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

end
