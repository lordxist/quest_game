require 'quest_system/configuration'

module QuestSystem
  def ready_for_join?
    starts_at - Time.now < QuestSystem.config.quest_join_time
  end

  def started?
    Time.now > starts_at
  end
end
