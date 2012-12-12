# -*- coding: utf-8 -*-

<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_<%= plural_table_name %>, :only => [:index]
  before_filter :set_<%= singular_table_name %>, :only => [:show, :edit, :update, :destroy]

  # GET <%= route_url %>
  # GET <%= route_url %>.json
  def index
    respond_to do |format|
      format.html
      format.json { render <%= key_value :json, "@#{plural_table_name}" %> }
    end
  end

  # GET <%= route_url %>/1
  # GET <%= route_url %>/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render <%= key_value :json, "@#{singular_table_name}" %> }
    end
  end

  # GET <%= route_url %>/new
  # GET <%= route_url %>/new.json
  def new
    new_<%= singular_table_name %>

    respond_to do |format|
      format.html
      format.json { render <%= key_value :json, "@#{singular_table_name}" %> }
    end
  end

  # GET <%= route_url %>/1/edit
  def edit
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.json
  def create
    new_<%= singular_table_name %>("params[:#{singular_table_name}]")

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to @<%= singular_table_name %>, <%= key_value :notice, "'#{human_name} was successfully created.'" %> }
        format.json { render <%= key_value :json, "@#{singular_table_name}" %>, <%= key_value :status, ':created' %>, <%= key_value :location, "@#{singular_table_name}" %> }
      else
        format.html { render <%= key_value :action, '"new"' %> }
        format.json { render <%= key_value :json, "@#{orm_instance.errors}" %>, <%= key_value :status, ':unprocessable_entity' %> }
      end
    end
  end

  # PUT <%= route_url %>/1
  # PUT <%= route_url %>/1.json
  def update
    respond_to do |format|
      if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
        format.html { redirect_to @<%= singular_table_name %>, <%= key_value :notice, "'#{human_name} was successfully updated.'" %> }
        format.json { head :no_content }
      else
        format.html { render <%= key_value :action, '"edit"' %> }
        format.json { render <%= key_value :json, "@#{orm_instance.errors}" %>, <%= key_value :status, ':unprocessable_entity' %> }
      end
    end
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.json
  def destroy
    @<%= orm_instance.destroy %>

    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url }
      format.json { head :no_content }
    end
  end

  private
  def set_<%= plural_table_name %>
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  def new_<%= singular_table_name %>(attributes = {})
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "attributes") %>
  end


end
<% end -%>
