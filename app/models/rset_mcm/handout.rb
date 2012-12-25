module RsetMcm
  class Handout < Content
    attr_accessible :data
    attr_accessible :tag_list

    mount_uploader :data, HandoutUploader

    before_validation :update_data_attributes

    def directory?
      false
    end

    private
    def update_data_attributes
      if data.present? && data_changed?
        self.file_size = data.file.size
      end
    end
  end
end
