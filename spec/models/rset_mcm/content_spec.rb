require 'spec_helper'

module RsetMcm
  describe Content do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:type).of_type(:string) }
    it { should have_db_column(:company_id).of_type(:integer) }
    it { should have_db_column(:ancestry).of_type(:string) }
    it { should have_db_column(:data).of_type(:string) }
    it { should have_db_column(:file_size).of_type(:integer) }
    it { should belong_to(:company) }

    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:ancestry) }
    it { should_not allow_mass_assignment_of(:company_id) }
    it { should_not allow_mass_assignment_of(:type) }
    it { should_not allow_mass_assignment_of(:data) }
    it { should_not allow_mass_assignment_of(:file_size) }

    it { should have_many(:taggings).dependent(:destroy) }
    it { should have_many(:base_tags).through(:taggings) }

    describe 'Validation' do
      describe "#name" do
        it { should ensure_length_of(:name).is_at_most(60) }
        it { should validate_presence_of(:name) }
        it "Uniqueness"
      end
    end
  end
end
