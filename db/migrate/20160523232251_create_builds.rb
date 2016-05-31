class CreateBuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :builds do |t|
      t.integer :violations_count, default: 0
      t.integer :repository_id
      t.jsonb :payload

      t.timestamps
    end
  end
end
