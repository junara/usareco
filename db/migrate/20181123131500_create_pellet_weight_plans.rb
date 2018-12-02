class CreatePelletWeightPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :pellet_weight_plans do |t|
      t.references :rabbit
      t.string :name
      t.jsonb :feeding
      t.datetime :revised_at
      t.bigint :created_by
      t.bigint :updated_by
      t.timestamps
    end
  end
end
