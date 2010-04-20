module <%= class_name %>JoinSystem
  def self.included(base)
    base.class_eval do
      belongs_to :<%= singular_name %>

      validate :no_early_<%= singular_name %>_joins, :if => "<%= singular_name %>_id_changed?"
      validate :<%= singular_name %>_must_not_have_started, :if => "<%= singular_name %>_id_changed?"
    end
  end

  def no_early_<%= singular_name %>_joins
    <%= singular_name %>.ready_for_join? || errors.add_to_base("You can't join <%= plural_name %> so early.")
  end

  def <%= singular_name %>_must_not_have_started
    !<%= singular_name %>.started? || errors.add_to_base("You can't join <%= plural_name %> after start.")
  end
end
