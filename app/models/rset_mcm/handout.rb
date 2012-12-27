module RsetMcm
  class Handout < Content
    attr_accessible :data
    attr_accessible :tag_list

    mount_uploader :data, HandoutUploader
    MAX_FILE_SIZE = 50.megabytes.to_i

    validates :data, :presence => true
    validates :file_size, :numericality => {:only_integer => true, :less_than_or_equal_to => MAX_FILE_SIZE}

    before_validation :update_data_attributes

    def directory?
      false
    end

    def file_type
      case name.split(".").last
      when "xls", "xlsx"
        "excel"
      when "doc", "docx"
        "word"
      when "ppt", "pptx"
        "power_point"
      else
        "file"
      end
    end

    private
    def update_data_attributes
      if data.present? && data_changed?
        self.file_size = data.file.size
      end
    end
  end
end
