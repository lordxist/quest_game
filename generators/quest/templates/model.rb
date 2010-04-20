class <%= class_name %> < ActiveRecord::Base
  include QuestGame::QuestSystem

  def players
    # implement this
    raise NotImplementedError.new('players method needs to be implemented')
  end
end
