class <%= player_class_name %> < ActiveRecord::Base
  belongs_to :<%= singular_name %>
  
  def no_early_<%= singular_name %>_joins
    <%= singular_name %>.ready_for_join? || errors.add_to_base("You can't join <%= plural_name %> so early.")
  end

  def <%= singular_name %>_must_not_have_started
    !<%= singular_name %>.started? || errors.add_to_base("You can't join <%= plural_name %> after start.")
  end

  def active?
    initiative_order == current_turn
  end
end
