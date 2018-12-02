class CreatePelletWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :pellet_weights do |t|
      t.references :rabbit
      t.integer :gram
      t.datetime :fed_at
      t.bigint :created_by
      t.bigint :updated_by
      t.timestamps
    end
  end
end
