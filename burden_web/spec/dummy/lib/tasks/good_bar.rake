namespace :good do
  desc 'One more good task'
  task :bar => [:foo] do
    'Hey!'
  end
end
