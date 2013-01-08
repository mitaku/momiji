module RsetMcm
  module ApplicationHelper
    class BlankException < StandardError; end

    def rset_mcm_file_size(num)
      number_to_human_size(num || 0, :precision => 1)
    end

    def file_icon_image_tag(content)
      image_tag content.icon_path, :size => "48x48"
    end

    def mcm_download_link(content)
      link_to content.name, download_content_handouts_path(content.parent_id, :name => content.name)
    end

    def list_with_info_block(_objects, key, i18n_options = {}, &block)
      objects = _objects.to_a
      if block_given? && objects.present?
        if objects.map { |obj| block.call(obj) }.none?
          raise BlankException
        end
      else
        raise BlankException
      end
    rescue BlankException
      concat(content_tag(:div, translate(key, i18n_options), :class => "alert alert-info alert_block"))
    end
  end
end
