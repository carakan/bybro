class AddEmailAndAccessTokenToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email, :access_token
    end
  end
end
