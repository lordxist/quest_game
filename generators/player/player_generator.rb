class PlayerGenerator < Rails::Generator::NamedBase
  attr_reader :quest_model_class_name

  def initialize(runtime_args, runtime_options = {})
    super

    unless args.empty?
      @quest_model_class_name = args.shift.camelize
    else
      @quest_model_class_name = 'Quest'
    end
  end

  def manifest
    record do |m|
      m.directory 'app/models'
      m.directory 'app/controllers'

      m.template 'model.rb', File.join('app/models/', "#{singular_name}.rb")

      m.template 'controller.rb', File.join('app/controllers/', "#{plural_name}_controller.rb")

      m.migration_template 'migration.rb', 'db/migrate', :assigns => {
          :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
      }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"

      m.route_resources plural_name
    end
  end

  protected
  def banner
    "Usage: #{$0} player ModelName [QuestModelName]"
  end
end