class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.column :starts_at, :datetime
      t.column :turn_duration, :integer, :default => 60
      t.column :quest_join_time, :integer, :default => 300

      t.timestamps
    end
    
    create_table :<%= player_table_name %> do |t|
      t.column :initiative_order, :integer
      t.column :quest_id, :integer
    end
  end

  def self.down
    drop_table :<%= table_name %>
    drop_table :<%= player_table_name %>
  end
end
