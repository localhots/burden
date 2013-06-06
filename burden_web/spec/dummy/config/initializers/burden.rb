Burden.configure do |c|
  c.storage = :active_record
  c.ignored_tasks = [:environment]
end
