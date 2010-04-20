class <%= class_name.pluralize %>Controller < ApplicationController
  def update
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
    @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])

    redirect_to(quests_url)
  end
end
