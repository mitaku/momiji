require 'spec_helper'

module RsetMcm
  describe Directory do
    describe 'Validation' do
      it "depth"
    end

    describe '#directory?' do
      its(:directory?) { should be }
    end

    describe '#file_type' do
      its(:file_type) { should == 'folder' }
    end

    describe '#handouts' do
    end

    describe '#build_handout' do
    end

    describe '#create_handout' do
    end

    describe '#build_directory' do
    end
  end
end
