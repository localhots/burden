namespace :bad do
  desc 'I meant to fail'
  task :failure do
    raise 'I am hopeless'
  end
end
