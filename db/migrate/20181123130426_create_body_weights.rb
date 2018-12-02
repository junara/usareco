class CreateBodyWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :body_weights do |t|
      t.references :rabbit
      t.integer :gram
      t.datetime :scaled_at
      t.bigint :created_by
      t.bigint :updated_by
      t.timestamps
    end
  end
end
