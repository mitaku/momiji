module Chocoholic
  class Handout < Content
    attr_accessible :data
    mount_uploader :data, HandoutUploader
  end
end
