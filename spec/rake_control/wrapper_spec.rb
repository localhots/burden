require 'spec_helper'

describe RakeControl::Wrapper do
  before :all do
    Rake::Task.define_task('dummy_task'){}
    Rake::Task['dummy_task'].invoke
  end

  it 'should work' do
    'YAY!'
  end
end
