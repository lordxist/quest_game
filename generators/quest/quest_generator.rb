class QuestGenerator < Rails::Generator::NamedBase
  attr_reader :controller_class_name
  attr_reader :player_controller_class_name
  attr_reader :player_singular_name
  attr_reader :player_plural_name
  attr_reader :player_class_name
  attr_reader :player_table_name

  def initialize(runtime_args, runtime_options = {})
    super

    @controller_class_name = plural_name.camelize
    @player_singular_name = args.shift || 'player'
    @player_class_name = @player_singular_name.camelize
    @player_controller_class_name = @player_class_name.pluralize
    @player_plural_name = @player_singular_name.pluralize
    @player_table_name = @player_plural_name
  end

  def manifest
    record do |m|
      m.directory 'app/models'
      m.directory 'app/controllers'
      m.directory "app/views/#{plural_name}"

      m.template 'model.rb', File.join('app/models/', "#{singular_name}.rb")
      m.template 'player_model.rb', File.join('app/models', "#{player_singular_name}.rb")

      m.template 'controller.rb', File.join('app/controllers/', "#{plural_name}_controller.rb")
      m.template 'player_controller.rb', File.join('app/controllers/', "#{player_plural_name}_controller.rb")

      m.template 'index.html.erb', File.join('app/views/', "#{plural_name}/index.html.erb")
      m.template 'show.html.erb', File.join('app/views/', "#{plural_name}/show.html.erb")

      m.migration_template 'migration.rb', 'db/migrate', :assigns => {
          :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
      }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"

      m.route_resources plural_name
      m.route_resources player_plural_name

      m.template 'model_join_system.rb', File.join('lib/', "#{singular_name}_join_system.rb")
      m.template 'model_turn_system.rb', File.join('lib/', "#{singular_name}_turn_system.rb")
    end
  end

  protected
  def banner
    "Usage: #{$0} quest ModelName [PlayerModelName]"
  end
end