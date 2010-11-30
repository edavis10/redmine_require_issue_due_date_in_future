require 'redmine'

Redmine::Plugin.register :redmine_require_issue_due_date_in_future do
  name 'Issue Due Date'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author 'Eric Davis of Little Stream Software'
  author_url 'http://www.littlestreamsoftware.com'
  
  description 'A Redmine plugin to require setting Issue due dates to a date in the future.'
  version '0.1.0'
  requires_redmine :version_or_higher => '0.8.0'
end
