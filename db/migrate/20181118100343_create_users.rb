class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :slug
      t.string :email
      t.string :image
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.timestamps
    end
    add_index :users, :slug, unique: true
  end
end
