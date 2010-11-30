require File.dirname(__FILE__) + '/../../../../test_helper'

class RedmineRequireIssueDueDateInFuture::Patches::IssueTest < ActionController::TestCase
  context "Issue" do
    setup do
      @issue = Issue.spawn
      @issue.project = @project = Project.generate!
      @issue.tracker = @project.trackers.first
    end
    
    should "be valid with an empty due date" do
      @issue.due_date = nil
      assert @issue.valid?
    end

    should "be valid with a blank due date" do
      @issue.due_date = ''
      assert @issue.valid?
    end

    should "be invalid with a due date before today" do
      @issue.due_date = 1.day.ago
      assert @issue.invalid?
      assert_equal "is not in the future", @issue.errors.on(:due_date)
    end
    
    should "be valid with a due date that is today" do
      @issue.due_date = Date.today
      assert @issue.valid?
    end
    
  end
end
