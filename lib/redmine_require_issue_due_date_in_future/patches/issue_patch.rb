module RedmineRequireIssueDueDateInFuture
  module Patches
    module IssuePatch
      def self.included(base)
        base.class_eval do
          unloadable

          validate :due_date_in_future

          protected
          def due_date_in_future
            return true if due_date.nil?

            if due_date.to_time < Date.today.beginning_of_day
              errors.add :due_date, :not_in_future
            end
   
          end
          
        end
      end
    end
  end
end
