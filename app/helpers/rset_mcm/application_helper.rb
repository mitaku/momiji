module RsetMcm
  module ApplicationHelper
    def rset_mcm_file_size(num)
      number_to_human_size(num || 0, :precision => 1)
    end

    def file_icon_image_tag(content)
      image_tag content.icon_path, :size => "48x48"
    end

    def list_with_info_block(_objects, key, i18n_options = {}, &block)
      objects = _objects.to_a
      if block_given? && objects.present?
        objects.each { |obj| block.call(obj) }
      else
        concat(content_tag(:div, translate(key, i18n_options), :class => "alert alert-info alert_block"))
      end
    end
  end
end
