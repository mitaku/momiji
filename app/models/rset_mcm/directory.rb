module RsetMcm
  class Directory < Content
    MAX_DEPTH = 10
    validates :depth, :numericality => {:only_integer => true, :less_than_or_equal_to => MAX_DEPTH}, :on => :create

    def directory?
      true
    end
  end
end
