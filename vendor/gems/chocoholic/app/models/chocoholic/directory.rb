module Chocoholic
  class Directory < Content

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
      h = build_handout(attr).save
    end
  end
end
