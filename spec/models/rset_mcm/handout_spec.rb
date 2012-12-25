require 'spec_helper'

module RsetMcm
  describe Handout do
    it { should allow_mass_assignment_of(:data) }
    it { should allow_mass_assignment_of(:tag_list) }

    describe '#directory?' do
      its(:directory?) { should be_false }
    end
  end
end
