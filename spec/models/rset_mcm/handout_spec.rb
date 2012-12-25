require 'spec_helper'

module RsetMcm
  describe Handout do
    it { should allow_mass_assignment_of(:data) }

    describe '#directory?' do
      its(:directory?) { should be_false }
    end
  end
end
