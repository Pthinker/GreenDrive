class CreateSpeeds < ActiveRecord::Migration
  def self.up
    create_table :speeds do |t|
      t.decimal :velocity
      t.integer :collect_time
      t.decimal :longtitude
      t.decimal :latitude
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :speeds
  end
end
