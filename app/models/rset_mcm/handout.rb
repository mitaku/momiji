module RsetMcm
  class Handout < Content
    attr_accessible :data

    def directory?
      false
    end
  end
end
