module Chocoholic
  class PermissionWidget < Apotomo::Widget
    include CellsHelperMethods

    responds_to_event :typing, :with => :search

    def url_for_event(type, options={})
      parent_controller.main_app.apotomo_event_path address_for_event(type, options)
    end

    def display
      render
    end

    def search
      items = target_company.users.where("email LIKE '%#{params[:query]}%'").map { |m| m.email }
      seed = target_company.user_categories.map do |c|
        c.items.map do |i|
          [c.name, i.name].join("-")
        end.flatten
      end.flatten

      items += seed.grep(/#{params[:query]}/)

      render :text => items.to_json
    end
  end
end
