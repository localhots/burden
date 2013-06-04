module RakeControl
  class Statistics
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def last
      relation.last
    end

    def log
      relation.all
    end

  private

    def relation
      Run.where(name: name)
    end
  end
end
