require 'spec_helper'
require 'ostruct'

describe Rake::Task do
  describe '#execute' do
    let(:dummy_task){ Rake::Task.new('dummy', OpenStruct.new) }

    context 'for dummy task' do
      subject{ dummy_task }
      its(:methods){ should include :execute }
      its(:methods){ should include :original_execute }
    end
  end
end
