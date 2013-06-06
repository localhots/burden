desc 'One unpredictable task'
task :unpredictable do
  raise 'oops' if rand(1..5) == 5
end
