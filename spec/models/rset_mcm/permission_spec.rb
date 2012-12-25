require 'spec_helper'

module RsetMcm
  describe Permission do
    it { should have_db_column(:mode).of_type(:string) }
    it { should have_db_column(:content_id).of_type(:integer) }
    it { should have_db_column(:resource_type).of_type(:string) }
    it { should have_db_column(:resource_id).of_type(:integer) }

    it { should allow_mass_assignment_of(:mode) }
    it { should_not allow_mass_assignment_of(:content_id) }
    it { should_not allow_mass_assignment_of(:resource_id) }
    it { should_not allow_mass_assignment_of(:resource_type) }

    it { should belong_to(:content) }
    it { should belong_to(:resource) }

    describe 'Validation' do
      it { should validate_presence_of(:mode) }
      it { should validate_presence_of(:resource_id) }
    end
  end
end
