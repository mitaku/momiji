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
  end
end
