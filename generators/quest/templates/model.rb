class <%= class_name %> < ActiveRecord::Base
  has_many :<%= player_plural_name %>

  def ready_for_join?
    starts_at - Time.now < quest_join_time
  end

  def started?
    Time.now > starts_at
  end

  def passed_time(time = Time.now)
    time - starts_at
  end

  def current_turn(time = Time.now)
    ((passed_time(time) - round_duration * passed_rounds(time)) / turn_duration).floor
  end

  def passed_rounds(time = Time.now)
    (passed_time / round_duration).floor
  end

  def round_duration
    turn_duration * <%= player_plural_name %>.count
  end
end
