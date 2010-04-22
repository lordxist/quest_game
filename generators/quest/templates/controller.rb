class <%= controller_class_name %>Controller < ApplicationController
  helper_method :current_player

  def index
    @<%= plural_name %> = Quest.find(:all)

    if <%= singular_name %> = current_player.<%= singular_name %>
      redirect_to(<%= singular_name %>)
    end
  end

  def show
    @<%= singular_name %> = Quest.find(params[:id])

    if current_player.<%= singular_name %> != @<%= singular_name %>
      redirect_to(<%= plural_name %>_url)
    end
  end

  private
  def current_player
    # implement this
    raise NotImplementedError.new('current_player method needs to be implemented')
  end
end
