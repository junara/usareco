class CreateRabbits < ActiveRecord::Migration[5.2]
  def change
    create_table :rabbits do |t|
      t.references :family
      t.string :name
      t.string :slug
      t.datetime :birthday
      t.references :breed
      t.datetime :welcomed_at
      t.bigint :created_by
      t.bigint :updated_by
      t.timestamps
    end
    add_index :rabbits, :slug, unique: true
  end
end
