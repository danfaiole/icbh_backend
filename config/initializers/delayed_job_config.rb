Delayed::Worker.sleep_delay = 120
Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
Delayed::Worker.destroy_failed_jobs = false

# Delayed job silencer
if Rails.env.production?
  module Delayed
    module Backend
      module ActiveRecord
        class Job
          class << self
            alias_method :reserve_original, :reserve
            def reserve(worker, max_run_time = Worker.max_run_time)
              previous_level = ::ActiveRecord::Base.logger.level
              ::ActiveRecord::Base.logger.level = Logger::INFO if previous_level < Logger::INFO
              value = reserve_original(worker, max_run_time)
              ::ActiveRecord::Base.logger.level = previous_level
              value
            end
          end
        end
      end
    end
  end
end