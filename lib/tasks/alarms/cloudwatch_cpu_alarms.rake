namespace :alarms do
	namespace :cloudwatch_cpu_alarms do
	  desc "TODO"
	  task create_high_priority_cloudwatch_alarms: :environment do
	  	puts "create_high_priority_cloudwatch_alarms"
	  end
	  task create_low_priority_cloudwatch_alarms: :environment do
	  	puts "create_low_priority_cloudwatch_alarms"
	  end
	end
end
