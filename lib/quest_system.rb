module QuestSystem
  def self.config
    @@config ||= Configuration.new
  end

  def self.configure(&block)
    raise "#configure must be sent a block" unless block_given?
    yield config
  end

  class Configuration
    attr_accessor_with_default :turn_duration, 60
    attr_accessor_with_default :quest_join_time, 300
  end
end