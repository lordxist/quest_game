class <%= player_controller_class_name %>Controller < ApplicationController
  def update
    @<%= player_singular_name %> = <%= player_class_name %>.find(params[:id])
    @<%= player_singular_name %>.update_attributes(params[:<%= player_singular_name %>])

    redirect_to(quests_url)
  end
end
