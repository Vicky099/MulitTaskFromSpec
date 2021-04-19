namespace :alarms do
	namespace :cloudwatch_alarms do
	  desc 'Create all Cloudwatch alarms'
    task create_all_cloudwatch_alarms: :environment do
      
      tasks_list = [
        'alarms:cloudwatch_cpu_alarms:create_high_priority_cloudwatch_alarms',
        'alarms:cloudwatch_cpu_alarms:create_low_priority_cloudwatch_alarms'
      ]

      tasks_list.each do |task|
        Rake::Task[task].execute
      rescue => e
      	puts "ERROR : #{e.message}"
      end
    end
	end
end
