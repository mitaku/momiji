module RsetMcm
  class Handout < Content
    attr_accessible :data
    attr_accessible :tag_list

    def directory?
      false
    end
  end
end
