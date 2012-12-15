module Chocoholic
  class Directory < Content


    #FIXME
    validates :depth, :numericality => {:only_integer => true, :less_than_or_equal_to => 3}, :on => :create

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
  end
end
