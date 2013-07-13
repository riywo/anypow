require "bundler/gem_tasks"

task :default => [:spec]
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.rspec_opts = %w[-cfs -r ./spec/spec_helper.rb]
  end
rescue LoadError => e
end
