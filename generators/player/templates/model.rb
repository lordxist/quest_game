class <%= class_name %> < ActiveRecord::Base
  include <%= quest_model_class_name %>JoinSystem
  include <%= quest_model_class_name %>TurnSystem
end
