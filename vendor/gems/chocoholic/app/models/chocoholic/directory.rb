module Chocoholic
  class Directory < Content
    #FIXME
    MAX_DEPTH = 5

    validates :depth, :numericality => {:only_integer => true, :less_than_or_equal_to => MAX_DEPTH}, :on => :create

    def file_type
      "folder"
    end

    def directory?
      true
    end

    def handouts
      children.where(:type => 'Chocoholic::Handout')
    end

    def build_handout(attr = {})
      h = Chocoholic::Handout.new(attr)
      h.company_id = self.company_id
      h.parent = self
      h
    end

    def create_handout(attr = {})
      build_handout(attr).save
    end

    def build_directory(attr = {})
      child = Chocoholic::Directory.new(attr)
      child.parent = self
      child.company_id = self.company_id

      child
    end

    def can_create_directory?
      depth < MAX_DEPTH
    end
  end
end
