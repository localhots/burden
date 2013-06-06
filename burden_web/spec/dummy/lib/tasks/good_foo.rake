namespace :good do
  desc 'One good task'
  task :foo => [:environment] do
    'Hello World!'
  end
end
