class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.column :starts_at, :datetime

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
