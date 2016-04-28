class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :origin_id
      t.integer :api_id
      t.string :origin_name
      t.boolean :active, default: false
      t.integer :user_id
      t.boolean :private
      t.string :provider

      t.timestamps null: false
    end
  end
end
