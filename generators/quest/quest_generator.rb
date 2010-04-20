class QuestGameGenerator < Rails::Generator::NamedBase
  def initialize(runtime_args, runtime_options = {})
    if runtime_args.empty?
      runtime_args << 'quest'
    end

    super(runtime_args, runtime_options)
  end

  def manifest
    record do |m|
      m.directory 'app/models'
      m.directory 'app/controllers'
      m.directory "app/views/#{plural_name}"

      m.file 'model.rb', File.join('app/models/', "#{singular_name}.rb")

      m.file 'controller.rb', File.join('app/controllers/', "#{plural_name}_controller.rb")

      m.file 'index.html.erb', File.join('app/models/', "#{plural_name}/index.html.erb")
      m.file 'show.html.erb', File.join('app/models/', "#{plural_name}/show.html.erb")

      m.migration_template 'migration.rb', 'db/migrate', :assigns => {
          :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
      }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"

      m.route_resources 'quests'

      m.file 'model_join_system.rb', File.join('lib/', "#{singular_name}_join_system.rb")
      m.file 'model_turn_system.rb', File.join('lib/', "#{singular_name}_turn_system.rb")
    end
  end

  protected
  def banner
    "Usage: #{$0} quest ModelName"
  end
end