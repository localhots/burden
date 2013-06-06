module RakeControlWeb
  module ApplicationHelper
    def task_label run
      case run.success
      when true
        'success'
      when false
        'alert'
      else
        'secondary'
      end
    end
  end
end
