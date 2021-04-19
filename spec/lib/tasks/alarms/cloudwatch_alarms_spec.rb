require 'spec_helper'
require 'rake_spec_helper'
require 'rake'

describe 'alarms:cloudwatch_alarms' do
	import_rake_task('lib/tasks/alarms/cloudwatch_alarms')
	import_rake_task('lib/tasks/alarms/cloudwatch_cpu_alarms', :task_path1)

	describe ':alarms' do
		describe ':create_all_cloudwatch_alarms' do
			subject {rake['alarms:cloudwatch_alarms:create_all_cloudwatch_alarms']}
			it 'attempts to create or update all cloudwatch alarms' do
				subject.invoke()
			end
		end
	end
end