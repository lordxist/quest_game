module <%= class_name %>TurnSystem
  def active?
    time = Time.now
    i = 0

    while (turn_start_time = turn_start_time(i)) < time do
      return true if time > turn_start_time && time < turn_start_time + turn_duration
      i += 1
    end
    false
  end

  def turn_start_time(round)
     <%= singular_name %>.starts_at + turn_duration * (initiative_order + round * <%= singular_name %>.players.size)
  end

  private
  def turn_duration
    @turn_duration ||= QuestSystem.config.turn_duration
  end
end
