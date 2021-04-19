# A block containing the repeated definition steps that Dalton rake specs require
RSpec.shared_context "rake task", shared_context: :metadata do |task_path|
  let(:rake) { Rake::Application.new }

  # rake_require uses the previously loaded paths, so we specify it should use the array of loaded
  # paths less the path for our desired rake task in order to make it available.
  def loaded_files_excluding_current_rake_file(task_path)
    $LOADED_FEATURES.reject { |file| file == File.join(Rails.root, task_path, '.rake') }
  end

  before do
    Rake.application = rake
    Rake.application.rake_require(task_path, [Rails.root.to_s], loaded_files_excluding_current_rake_file(task_path))
    Rake::Task.define_task(:environment)
  end
end

def import_rake_task(task_path, task_name=:task_path)
  include_context "rake task", task_path do
    let(task_name) { task_path }
  end
end