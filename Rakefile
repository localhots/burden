require 'bundler/gem_tasks'
require 'rake_control'

task :regular_task do
  puts 'I am being invoked'
end

task :failing_task do
  raise 'wtf'
end

task :sleepy_task do
  puts 'Sleeping...'
  sleep 2
  puts 'Woke up!'
end
