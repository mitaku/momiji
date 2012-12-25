module RsetMcm
  class Directory < Content
    MAX_DEPTH = 10
    FILE_TYPE = "folder"

    validates :depth, :numericality => {:only_integer => true, :less_than_or_equal_to => MAX_DEPTH}, :on => :create

    def file_type
      FILE_TYPE
    end

    def directory?
      true
    end

    def handouts
      children.where(:type => 'RsetMcm::Handout')
    end

    def build_handout(attr = {})
      h = RsetMcm::Handout.new(attr)
      h.company_id = self.company_id
      h.parent = self
      h
    end

    def create_handout(attr = {})
      build_handout(attr).save
    end

    def build_directory(attr = {})
      d = RsetMcm::Directory.new(attr)
      d.parent = self
      d.company_id = self.company_id
      d
    end
  end
end
