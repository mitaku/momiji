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
  end
end
